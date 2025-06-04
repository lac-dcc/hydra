#include "Profile.h"
#include "WeightedProfileInference.h"
#include <string>
#include <regex>
#include <iostream>
#include <queue>
#include <unordered_map>
#include <unordered_set>
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/Bitfields.h"
#include "llvm/ADT/Hashing.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/xxhash.h"


using namespace llvm;

cl::opt<std::string> LLFilename("prog", cl::desc("<program ll file>"), cl::Required);
cl::opt<std::string> ProfilesFolder("prof", cl::desc("<profiles folder>"), cl::Required);
cl::opt<unsigned> MatchingThreshold(
    "matching-threshold",
    cl::desc("The threshold for matching blocks"),
    cl::init(0), cl::Hidden);

namespace opts {

cl::opt<unsigned> StaleMatchingMaxFuncSize(
  "stale-matching-max-func-size",
  cl::desc("The maximum size of a function to consider for inference."),
  cl::init(10000), cl::Hidden);

// Parameters of the profile inference algorithm. The default values are tuned
// on several benchmarks.
cl::opt<bool> StaleMatchingEvenFlowDistribution(
    "stale-matching-even-flow-distribution",
    cl::desc("Try to evenly distribute flow when there are multiple equally "
             "likely options."),
    cl::init(true), cl::ReallyHidden);

cl::opt<bool> StaleMatchingRebalanceUnknown(
    "stale-matching-rebalance-unknown",
    cl::desc("Evenly re-distribute flow among unknown subgraphs."),
    cl::init(false), cl::ReallyHidden);

cl::opt<bool> StaleMatchingJoinIslands(
    "stale-matching-join-islands",
    cl::desc("Join isolated components having positive flow."), cl::init(true),
    cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostBlockInc(
    "stale-matching-cost-block-inc",
    cl::desc("The cost of increasing a block count by one."), cl::init(150),
    cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostBlockDec(
    "stale-matching-cost-block-dec",
    cl::desc("The cost of decreasing a block count by one."), cl::init(150),
    cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostJumpInc(
    "stale-matching-cost-jump-inc",
    cl::desc("The cost of increasing a jump count by one."), cl::init(150),
    cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostJumpDec(
    "stale-matching-cost-jump-dec",
    cl::desc("The cost of decreasing a jump count by one."), cl::init(150),
    cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostBlockUnknownInc(
    "stale-matching-cost-block-unknown-inc",
    cl::desc("The cost of increasing an unknown block count by one."),
    cl::init(1), cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostJumpUnknownInc(
    "stale-matching-cost-jump-unknown-inc",
    cl::desc("The cost of increasing an unknown jump count by one."),
    cl::init(140), cl::ReallyHidden);

cl::opt<unsigned> StaleMatchingCostJumpUnknownFTInc(
    "stale-matching-cost-jump-unknown-ft-inc",
    cl::desc(
        "The cost of increasing an unknown fall-through jump count by one."),
    cl::init(3), cl::ReallyHidden);

};


std::string extractAndFormatDigits(const std::string &s) {
  std::string::size_type pos = s.find(".");
  if (pos == std::string::npos) {
    return (s.size() == 2 ? "0" : s.substr(2));
  } else {
    std::string bb1 = s.substr(0,pos), bb2, args, aux;
    bb1 = (bb1.size() == 2 ? "0" : bb1.substr(2));
    aux = s.substr(pos+1);
    if (aux == "loopexit") {
      return bb1+".le";
    }
    pos = aux.find("_");
    bb2 = aux.substr(0,pos);
    args = aux.substr(pos+1);
    bb2 = (bb2.size() == 2 ? "0" : bb2.substr(2));
    if (args == "crit_edge") {
      return bb1+"_"+bb2+".ce";
    } else {
      return bb1+"_"+bb2+"."+args;
    }
  }
  
  return "0";
}

/// An object wrapping two vectors, where one represents the opcodes and the
/// other the frequency of every opcode.
struct OpcodeHistogram {
private:
  std::vector<uint32_t> Opcodes, Frequency;
  bool Matched;
public:
  explicit OpcodeHistogram() {}

  explicit OpcodeHistogram(const std::vector<uint32_t> &_Opcodes,
                            const std::vector<uint32_t> &_Frequency) {
    assert(Opcodes.size() == Frequency.size() &&
            "Opcode Histogram size mismatch");
    Opcodes.assign(_Opcodes.begin(), _Opcodes.end());
    Frequency.assign(_Frequency.begin(), _Frequency.end());
    Matched = false;
  }

  bool isMatched() {
    return Matched;
  }

  void Match() {
    Matched = true;
  }

  uint64_t distance2(const OpcodeHistogram &OH) const {
    std::map<uint32_t, int64_t> Frequencies;
    for (size_t I = 0; I < Opcodes.size(); I++) {
      Frequencies[Opcodes[I]] = Frequency[I];
    }
    
    
    for (size_t I = 0; I < OH.Opcodes.size(); I++) {
      if (Frequencies.count(OH.Opcodes[I]) > 0) {
        Frequencies[OH.Opcodes[I]] -= (int64_t)OH.Frequency[I];
      } else {
        Frequencies[OH.Opcodes[I]] = OH.Frequency[I];
      }
    }

    int64_t Distance2 = 0;
    
    for (const auto [Opcode, Freq] : Frequencies) {
      Distance2 += (Freq*Freq);
    }
    
    return (uint64_t)Distance2;
  }
};

class OpcodeHistogramMatcher {
public:
  void init(const std::vector<FlowBlock *> &Blocks,
            const std::vector<OpcodeHistogram *> &Histograms) {
    assert(Blocks.size() == Histograms.size() &&
            "incorrect matcher initialization");
    this->Blocks = Blocks;
    this->Histograms = Histograms;
    // for (size_t I = 0; I < Blocks.size(); I++) {
    //   FlowBlock *Block = Blocks[I];
    //   OpcodeHistogram *Histogram = Histograms[I];
    //   OpHistToBlocks[Histogram] = Block;
    // }
  }

  FlowBlock *matchBlock(OpcodeHistogram &OH, uint64_t Threshold) const {
    FlowBlock *BestBlock = nullptr;
    OpcodeHistogram *MatchedHistogram = nullptr;

    uint64_t BestDistance = Threshold+1;

    FlowBlock *Block = nullptr;
    OpcodeHistogram *Histogram = nullptr;
    for (size_t I = 0; I < Blocks.size(); ++I) {
      Block = Blocks[I];
      Histogram = Histograms[I];
      if (Histogram->isMatched()) 
        continue;
      uint64_t CurrentDistance = Histogram->distance2(OH);
      if (CurrentDistance < BestDistance) {
        BestDistance = CurrentDistance;
        BestBlock = Block;
        MatchedHistogram = Histogram;
      }
    }
    
    if (MatchedHistogram != nullptr)
      MatchedHistogram->Match();
    return BestBlock;
  }

private:
  std::vector<FlowBlock *> Blocks;
  std::vector<OpcodeHistogram *> Histograms;
  // std::unordered_map<OpcodeHistogram *, FlowBlock *> OpHistToBlocks;
};

long double getEdgeProbability(BranchProbabilityInfo &bpi, BasicBlock *src, BasicBlock *dst) {
  auto EdgeProbability = bpi.getEdgeProbability(src, dst);
  return ((long double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
}

FlowFunction createFlowFunction(std::vector<BasicBlock *> &BlockOrder, BranchProbabilityInfo &bpi) {
  FlowFunction Func;

  // Add a special "dummy" source so that there is always a unique entry point.
  // Because of the extra source, for all other blocks in FlowFunction it holds
  // that Block.Index == BB->getIndex() + 1
  FlowBlock EntryBlock;
  EntryBlock.Index = 0;
  Func.Blocks.push_back(EntryBlock);

  // Create FlowBlock for every basic block in the binary function
  std::map<BasicBlock *, size_t> BlockIndex;
  for (BasicBlock *BB : BlockOrder) {
    Func.Blocks.emplace_back();
    FlowBlock &Block = Func.Blocks.back();
    Block.Index = Func.Blocks.size() - 1;
    BlockIndex[BB] = Block.Index;
    // (void)BB;
  }

  // Create FlowJump for each jump between basic blocks in the binary function
  std::vector<uint64_t> InDegree(Func.Blocks.size(), 0);
  for (BasicBlock *SrcBB : BlockOrder) {
    std::unordered_set<BasicBlock *> UniqueSuccs;
    // Collect regular jumps
    for (BasicBlock *DstBB : successors(SrcBB)) {
      // Ignoring parallel edges
      if (UniqueSuccs.find(DstBB) != UniqueSuccs.end())
        continue;

      Func.Jumps.emplace_back();
      FlowJump &Jump = Func.Jumps.back();
      Jump.Source = BlockIndex[SrcBB];
      Jump.Target = BlockIndex[DstBB];
      InDegree[Jump.Target]++;
      UniqueSuccs.insert(DstBB);
      Func.JumpProbability[&Jump] = getEdgeProbability(bpi, SrcBB, DstBB);
    }
    // // Collect jumps to landing pads
    // for (const BinaryBasicBlock *DstBB : SrcBB->landing_pads()) {
    //   // Ignoring parallel edges
    //   if (UniqueSuccs.find(DstBB) != UniqueSuccs.end())
    //     continue; 

    //   Func.Jumps.emplace_back();
    //   FlowJump &Jump = Func.Jumps.back();
    //   Jump.Source = BlockIndex[SrcBB];
    //   Jump.Target = BlockIndex[DstBB];
    //   InDegree[Jump.Target]++;
    //   UniqueSuccs.insert(DstBB);
    // }
  }

  // Add dummy edges to the extra sources. If there are multiple entry blocks,
  // add an unlikely edge from 0 to the subsequent ones
  assert(InDegree[0] == 0 && "dummy entry blocks shouldn't have predecessors");
  for (uint64_t I = 1; I < Func.Blocks.size(); I++) {
    BasicBlock *BB = BlockOrder[I - 1];
    if (BB->isEntryBlock() || InDegree[I] == 0) {
      Func.Jumps.emplace_back();
      FlowJump &Jump = Func.Jumps.back();
      Jump.Source = 0;
      Jump.Target = I;
      if (!BB->isEntryBlock())
        Jump.IsUnlikely = true;
    }
  }

  // Create necessary metadata for the flow function
  for (FlowJump &Jump : Func.Jumps) {
    Func.Blocks.at(Jump.Source).SuccJumps.push_back(&Jump);
    Func.Blocks.at(Jump.Target).PredJumps.push_back(&Jump);
  }
  return Func;
}

OpcodeHistogram initializeHistogram(BasicBlock &BB) {
  std::vector<uint32_t> opcodes, frequency;
  for (Instruction &inst : BB) {
    unsigned instOpcode = inst.getOpcode();
    unsigned opcodeIdx = 0;
    for (unsigned opcode : opcodes) {
      if (opcode == instOpcode) {
        break;
      }
      ++opcodeIdx;
    }
    if (opcodeIdx == opcodes.size()) {
      opcodes.push_back(instOpcode);
      frequency.push_back(1);
    } else {
      ++frequency[opcodeIdx];
    }
  }
  return OpcodeHistogram(opcodes, frequency);
}

void ProfilePass::projectProfile(Function &oldFunction, Function &newFunction, BranchProbabilityInfo &bpi) {
  std::vector<BasicBlock *> oldBlockOrder, newBlockOrder;
  std::map<std::string, size_t> oldBlockIndex, newBlockIndex;
  new_profile.clear();

  for (BasicBlock &BB : oldFunction) {
    oldBlockIndex[extractAndFormatDigits(BB.getName().str())] = oldBlockOrder.size();
    oldBlockOrder.push_back(&BB);
  }

  for (BasicBlock &BB : newFunction) {
    newBlockOrder.push_back(&BB);
  }

  // Initialize Flow Function
  FlowFunction flowFunc = createFlowFunction(newBlockOrder, bpi);
  size_t numBlocks = flowFunc.Blocks.size();
  // Initialize histograms

  assert(numBlocks == newBlockOrder.size() + 1);

  std::vector<FlowBlock *> blocks;
  std::vector<OpcodeHistogram> histograms;
  std::vector<OpcodeHistogram *> histogramsAddresses;

  // Initialize histograms for newFunction
  for (size_t i = 0; i < newBlockOrder.size(); ++i) {
    BasicBlock *BB = newBlockOrder[i];
    blocks.push_back(&flowFunc.Blocks[i+1]);

    histograms.push_back(initializeHistogram(*BB));
  }

  for (size_t i = 0; i < histograms.size(); ++i) {
    histogramsAddresses.push_back(&(histograms[i]));
  }

  OpcodeHistogramMatcher OHM;
  OHM.init(blocks, histogramsAddresses);

  DenseMap<uint64_t, FlowBlock *> matchedBlocks;

  // Match blocks from old function to new function
  for (BasicBlock *oldBB : oldBlockOrder) {
    std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
    OpcodeHistogram oldHistogram = initializeHistogram(*oldBB);
    FlowBlock *matchedBlock = OHM.matchBlock(oldHistogram, MatchingThreshold);

    if (matchedBlock == nullptr && oldBlockIndex[oldBBName] == 0) {
      matchedBlock = blocks[0];
      // outfile << "Matched entry block\n";
    }

    if (matchedBlock != nullptr) {
      // outfile << "Matched blocks " << oldBBName << " and "
      //         << extractAndFormatDigits(newBlockOrder[matchedBlock->Index-1]->getName().str()) << "\n";
      matchedBlocks[oldBlockIndex[oldBBName]] = matchedBlock;
    }
  }

  // Match jumps from old function to new function
  std::vector<uint64_t> OutWeight(numBlocks, 0);
  std::vector<uint64_t> InWeight(numBlocks, 0);

  for (BasicBlock *oldBB : oldBlockOrder) {
    std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
    // outfile << "Checking old basic block " << oldBBName << "\n";
    for (auto [succ, freq] : profile[oldBBName]) {
      // outfile << "Checking jump " << oldBBName << " -> "
      //         << succ << " with frequency " << freq << "\n";
      if (freq == 0)
        continue;

      size_t srcIndex = oldBlockIndex[oldBBName];
      size_t dstIndex = oldBlockIndex[succ];

      // outfile << srcIndex << " " << dstIndex << "\n";

      FlowBlock *matchedSrcBlock = matchedBlocks.lookup(srcIndex);
      FlowBlock *matchedDstBlock = matchedBlocks.lookup(dstIndex);

      // outfile << matchedSrcBlock << " " << matchedDstBlock << "\n";

      if (matchedSrcBlock != nullptr && matchedDstBlock != nullptr) {
        // find a jump between the two blocks
        // outfile << "Blocks matched, trying to find jump\n";
        FlowJump *jump = nullptr;
        for (FlowJump *succJump : matchedSrcBlock->SuccJumps) {
          if (succJump->Target == matchedDstBlock->Index) {
            jump = succJump;
            break;
          }
        }

        if (jump != nullptr) {
          jump->Weight = freq;
          jump->HasUnknownWeight = false;
        }
      }

      if (matchedSrcBlock != nullptr) {
        OutWeight[matchedSrcBlock->Index] += freq;
      }

      if (matchedDstBlock != nullptr) {
        InWeight[matchedDstBlock->Index] += freq;
      }
    }
  }

  // Assign weights from matched blocks
  for (FlowBlock &Block : flowFunc.Blocks) {
    if (OutWeight[Block.Index] == 0 && InWeight[Block.Index] == 0) {
      assert(Block.HasUnknownWeight && "unmatched block with a positive count");
      // if (Block.Index)
        // outfile << Block.Index-1 << "\n";
        // outfile << extractAndFormatDigits(newBlockOrder[Block.Index-1]->getName().str()) << " : 0\n";
      continue;
    }
    Block.HasUnknownWeight = false;
    Block.Weight = std::max(OutWeight[Block.Index], InWeight[Block.Index]);
    // outfile << extractAndFormatDigits(newBlockOrder[Block.Index-1]->getName().str()) << " : "
    //         << Block.Weight << "\n";
  }

  // Use a BFS to find all blocks that are reachable from source and do not
  // have a path to exit, and mark them as cold blocks

  // Start bfs from the source
  std::queue<uint64_t> queue;
  std::vector<bool> visitedEntry(numBlocks, false);
  for (size_t i = 0; i < numBlocks; ++i) {
    FlowBlock &block = flowFunc.Blocks[i];
    if (block.isEntry()) {
      queue.push(i);
      visitedEntry[i] = true;
      break;
    }
  }

  while (!queue.empty()) {
    uint64_t src = queue.front();
    queue.pop();
    for (FlowJump *jump : flowFunc.Blocks[src].SuccJumps) {
      const uint64_t dst = jump->Target;
      if (!visitedEntry[dst]) {
        queue.push(dst);
        visitedEntry[dst] = true;
      }
    }
  }

  // Start bfs from all sinks
  std::vector<bool> visitedExit(numBlocks, false);
  for (uint64_t i = 0; i < numBlocks; i++) {
    FlowBlock &block = flowFunc.Blocks[i];
    if (block.isExit() && visitedEntry[i]) {
      queue.push(i);
      visitedExit[i] = true;
    }
  }
  while (!queue.empty()) {
    const uint64_t src = queue.front();
    queue.pop();
    for (FlowJump *jump : flowFunc.Blocks[src].PredJumps) {
      const uint64_t dst = jump->Source;
      if (!visitedExit[dst]) {
        queue.push(dst);
        visitedExit[dst] = true;
      }
    }
  }

  // Make all blocks of zero weight so that flow is not sent
  for (uint64_t i = 0; i < numBlocks; i++) {
    FlowBlock &block = flowFunc.Blocks[i];
    if (block.Weight == 0)
      continue;
    if (!visitedEntry[i] || !visitedExit[i]) {
      block.Weight = 0;
      block.HasUnknownWeight = true;
      block.IsUnlikely = true;
      for (FlowJump *jump : block.SuccJumps) {
        if (jump->Source == block.Index && jump->Target == block.Index) {
          jump->Weight = 0;
          jump->HasUnknownWeight = true;
          jump->IsUnlikely = true;
        }
      }
    }
  }

  // Check if inference is appliable
  if (flowFunc.Blocks.size() > opts::StaleMatchingMaxFuncSize) {
    outfile << "Function exceeded Max Size\n";
    return;
  }

  bool hasExitBlocks = llvm::any_of(
      flowFunc.Blocks, [&](const FlowBlock &block) { return block.isExit(); });
  if (!hasExitBlocks) {
    outfile << "Function doesn't have exit blocks\n";
    return;
  }

    // Set the params from the command-line flags.
  ProfiParams params;
  params.EvenFlowDistribution = opts::StaleMatchingEvenFlowDistribution;
  params.RebalanceUnknown = opts::StaleMatchingRebalanceUnknown;
  params.JoinIslands = opts::StaleMatchingJoinIslands;

  params.CostBlockInc = opts::StaleMatchingCostBlockInc;
  params.CostBlockEntryInc = opts::StaleMatchingCostBlockInc;
  params.CostBlockDec = opts::StaleMatchingCostBlockDec;
  params.CostBlockEntryDec = opts::StaleMatchingCostBlockDec;
  params.CostBlockUnknownInc = opts::StaleMatchingCostBlockUnknownInc;

  params.CostJumpInc = opts::StaleMatchingCostJumpInc;
  params.CostJumpFTInc = opts::StaleMatchingCostJumpInc;
  params.CostJumpDec = opts::StaleMatchingCostJumpDec;
  params.CostJumpFTDec = opts::StaleMatchingCostJumpDec;
  params.CostJumpUnknownInc = opts::StaleMatchingCostJumpUnknownInc;
  params.CostJumpUnknownFTInc = opts::StaleMatchingCostJumpUnknownFTInc;

  // Apply inference
  applyFlowInference(params, flowFunc);
  
  // Assign inferred profile
  assert(numBlocks == newBlockOrder.size() + 1);

  BasicBlock *hottestBlock = nullptr;
  uint64_t highestFrequency = 0;

  using bbd = std::pair<BasicBlock *, uint64_t>;
  std::vector<bbd> orderedBlocks;
  
  // /// Outputting old block ordering
  // std::vector<bbd> orderedOldBlocks;
  // for (BasicBlock *BB : oldBlockOrder) {
  //   uint64_t p = 0;
  //   auto BBName = extractAndFormatDigits(BB->getName().str());
  //   for (auto [DstBlock, Freq] : profile[BBName]) {
  //     p += Freq;
  //   }
  //   orderedOldBlocks.emplace_back(BB, p);
  // }

  // std::sort(orderedOldBlocks.begin(), orderedOldBlocks.end(), [](bbd &a, bbd &b) {
  //   auto [aBB, aFreq] = a;
  //   auto [bBB, bFreq] = b;
  //   std::string aName = extractAndFormatDigits(aBB->getName().str());
  //   std::string bName = extractAndFormatDigits(bBB->getName().str());
  //   return aFreq > bFreq || (aFreq == bFreq && aName < bName);
  // });

  // std::cout << "Old block ordering\n";
  // for (auto [BB, Freq] : orderedOldBlocks) {
  //   auto BBName = extractAndFormatDigits(BB->getName().str());
  //   std::cout << BBName << " " << Freq << "\n";
  // }
  // /// End of old block ordering

  for (FlowBlock &block : flowFunc.Blocks) {
    if (block.Index > 0) {
      BasicBlock *matchedBlock = newBlockOrder[block.Index-1];
      if (matchedBlock != nullptr) {
        orderedBlocks.emplace_back(matchedBlock, block.Weight);
      }
    }
  }

  std::sort(orderedBlocks.begin(), orderedBlocks.end(), [](bbd &a, bbd &b) {
    auto [aBB, aFreq] = a;
    auto [bBB, bFreq] = b;
    std::string aName = extractAndFormatDigits(aBB->getName().str());
    std::string bName = extractAndFormatDigits(bBB->getName().str());
    return aFreq > bFreq || (aFreq == bFreq && aName < bName);
  });

  // std::cout << "Profiled block ordering\n";
  for (auto [BB, Freq] : orderedBlocks) {
    auto BBName = extractAndFormatDigits(BB->getName().str());
    outfile << BBName << "\n";
    // std::cout << BBName << " " << Freq << "\n";
  }

}

// Read a profile file
bool ProfilePass::readProfile(std::string functionName) {
  profile.clear();
  profileFile.open(ProfilesFolder+"/"+functionName+".prof.full.edges");
  if (!profileFile) {
    return false;
  }
  std::string srcBlockName;
  std::string dstBlockName;

  std::string arrow;
  std::string colon;
  uint64_t frequency;

  while (profileFile >> srcBlockName >> arrow >> dstBlockName >> colon >> frequency) {
    // outfile << "Read " << srcBlockName << " -> " << dstBlockName << " : " << frequency << "\n";
    // if (!profile.count(srcBlockName)) {
    //   profile[srcBlockName] = {};
    // }
    profile[srcBlockName].emplace_back(dstBlockName, frequency);
  }

  profileFile.close();
  return true;
}

PreservedAnalyses ProfilePass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  std::string functionName = F.getName().str();
  outfile.open(functionName + "-profile.txt");

  if (!this->readProfile(functionName)) {
    outfile << "No profile found for function " << functionName << "\n";
    outfile.close();
    return PreservedAnalyses::all();
  }

  // Parse old program
  LLVMContext context;
  SMDiagnostic err;

  StringRef oldFileName = LLFilename;

  llvm::BranchProbabilityInfo &bpi = AM.getResult<llvm::BranchProbabilityAnalysis>(F);

  std::unique_ptr<Module> oldProgram = parseIRFile(LLFilename, err, context);

  bool foundFunction = false;

  for (Function &fun : *oldProgram) {
    // Project profile from the function with the same name in the old program
    // Check if -O3 don't change function names
    if (fun.getName().str() == functionName) {
      // std::cout << "Running projection for function " << functionName << "\n";
      this->projectProfile(fun, F, bpi);
      foundFunction = true;
      break;
    }
  }

  // if (!foundFunction) {
  //   outfile << "Function " << functionName << " not found on old program\n";
  // } else {
  //   for (auto [block, succs] : new_profile) {
  //     for (auto [succ, freq] : succs) {
  //       outfile << block << " -> " << succ << " : " << freq << "\n";
  //     }
  //   }
  // }


  outfile.close();

  return PreservedAnalyses::all();
}