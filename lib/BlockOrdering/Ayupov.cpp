#include "Ayupov.h"
#include "WeightedProfileInference.h"
#include <string>
#include <regex>
#include <iostream>
#include <queue>
#include <unordered_map>
#include <unordered_set>
#include <cmath>
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/Bitfields.h"
#include "llvm/ADT/Hashing.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/xxhash.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Analysis/LoopAnalysisManager.h"
#include "llvm/Analysis/CGSCCPassManager.h"
#include "llvm/ADT/Bitfields.h"
#include "llvm/ADT/Hashing.h"


using namespace llvm;

cl::opt<std::string> LLFilename("prog", cl::desc("<program ll file>"), cl::Required);
cl::opt<std::string> ProfilesFolder("prof", cl::desc("<profiles folder>"), cl::Required);
cl::opt<unsigned> MatchingThreshold(
    "matching-threshold",
    cl::desc("The threshold for matching blocks"),
    cl::init(0), cl::Hidden);
cl::opt<size_t> MaxIterations(
    "max-iterations",
    cl::desc("Maximum number of iterations of block matching"),
    cl::init(3), cl::Hidden);
cl::opt<bool> Debug("d", cl::desc("Enable debug messages"));
cl::opt<bool> VerboseDebug("v", cl::desc("Enable verbose debug messages, must use with -d"));

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
    } else if (aux == "preheader") {
      return bb1+".ph";
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

/// The object is used to identify and match basic blocks in a BinaryFunction
/// given their hashes computed on a binary built from several revisions behind
/// release.
class StaleMatcher {
public:
  /// Initialize stale matcher.
  void init(const std::vector<FlowBlock *> &Blocks,
            const std::vector<BlendedBlockHash> &Hashes) {
    assert(Blocks.size() == Hashes.size() &&
           "incorrect matcher initialization");
    for (size_t I = 0; I < Blocks.size(); I++) {
      FlowBlock *Block = Blocks[I];
      uint16_t OpHash = Hashes[I].OpcodeHash;
      OpHashToBlocks[OpHash].push_back(std::make_pair(Hashes[I], Block));
    }
  }

  /// Find the most similar block for a given hash.
  const FlowBlock *matchBlock(BlendedBlockHash BlendedHash) const {
    auto BlockIt = OpHashToBlocks.find(BlendedHash.OpcodeHash);
    if (BlockIt == OpHashToBlocks.end())
      return nullptr;
    FlowBlock *BestBlock = nullptr;
    uint64_t BestDist = std::numeric_limits<uint64_t>::max();
    for (const auto &[Hash, Block] : BlockIt->second) {
      uint64_t Dist = Hash.distance(BlendedHash);
      if (BestBlock == nullptr || Dist < BestDist) {
        BestDist = Dist;
        BestBlock = Block;
      }
    }
    return BestBlock;
  }

  /// Returns true if the two basic blocks (in the binary and in the profile)
  /// corresponding to the given hashes are matched to each other with a high
  /// confidence.
  static bool isHighConfidenceMatch(BlendedBlockHash Hash1,
                                    BlendedBlockHash Hash2) {
    return Hash1.InstrHash == Hash2.InstrHash;
  }

private:
  using HashBlockPairType = std::pair<BlendedBlockHash, FlowBlock *>;
  std::unordered_map<uint16_t, std::vector<HashBlockPairType>> OpHashToBlocks;
};

std::string hashInst(const Instruction &Inst) {
    return std::string(Inst.getOpcodeName());
}

std::string hashBlock(const BasicBlock &BB) {
  // The hash is computed by creating a string of all instruction opcodes and
  // possibly their operands and then hashing that string with std::hash.
  std::string HashString;

  for (const Instruction &Inst : BB) {
    HashString.append(hashInst(Inst));
  }
  return HashString;
}

/// A "loose" hash of a basic block to use with the stale profile matching. The
/// computed value will be the same for blocks with minor changes (such as
/// reordering of instructions or using different operands) but may result in
/// collisions that need to be resolved by a stronger hashing.
std::string hashBlockLoose(const BasicBlock &BB) {
  // The hash is computed by creating a string of all lexicographically ordered
  // instruction opcodes, which is then hashed with std::hash.
  std::set<std::string> Opcodes;
  for (const Instruction &Inst : BB) {
    Opcodes.insert(Inst.getOpcodeName());
  }

  std::string HashString;
  for (const std::string &Opcode : Opcodes)
    HashString.append(Opcode);
  return HashString;
}

void AyupovPass::computeBlockHashes(Function &F, bool old) {

  std::vector<BlendedBlockHash> BlendedHashes(F.size());
  std::vector<uint64_t> OpcodeHashes(F.size());
  DenseMap<BasicBlock *, uint64_t> BasicBlockIdx;
  // Initialize hash components.
  size_t I = 0;
  for (BasicBlock &BB : F) {
    std::string InstrHashStr = hashBlock(BB);
    uint64_t InstrHash = std::hash<std::string>{}(InstrHashStr);
    BlendedHashes[I].InstrHash = (uint16_t)hash_value(InstrHash);
    // Hashing opcodes.
    std::string OpcodeHashStr = hashBlockLoose(BB);
    OpcodeHashes[I] = std::hash<std::string>{}(OpcodeHashStr);
    BlendedHashes[I].OpcodeHash = (uint16_t)hash_value(OpcodeHashes[I]);
    BasicBlockIdx[&BB] = I++;
  }

  // Initialize neighbor hash.
  I = 0;
  for (BasicBlock &BB : F) {
    uint64_t Hash = 0;
    for (BasicBlock *SuccBB : successors(&BB)) {
      uint64_t SuccHash = OpcodeHashes[BasicBlockIdx[SuccBB]];
      Hash = hashing::detail::hash_16_bytes(Hash, SuccHash);
    }
    BlendedHashes[I].SuccHash = (uint8_t)hash_value(Hash);
    ++I;
  }

  I = 0;
  for (BasicBlock &BB : F) {
    // Append hashes of successors.
    uint64_t Hash = 0;
    for (BasicBlock *SuccBB : successors(&BB)) {
      uint64_t SuccHash = OpcodeHashes[BasicBlockIdx[SuccBB]];
      Hash = hashing::detail::hash_16_bytes(Hash, SuccHash);
    }
    BlendedHashes[I].SuccHash = (uint8_t)hash_value(Hash);

    // Append hashes of predecessors.
    Hash = 0;
    for (BasicBlock *PredBB : predecessors(&BB)) {
      uint64_t PredHash = OpcodeHashes[BasicBlockIdx[PredBB]];
      Hash = hashing::detail::hash_16_bytes(Hash, PredHash);
    }
    BlendedHashes[I].PredHash = (uint8_t)hash_value(Hash);
    ++I;
  }

  //  Assign hashes.
  I = 0;
  for (BasicBlock &BB : F) {
    if (old)
      old_blocks_hash[&BB] = BlendedHashes[I].combine();
    else
      new_blocks_hash[&BB] = BlendedHashes[I].combine();
    ++I;
  }
}

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


void AyupovPass::projectProfile(Function &oldFunction, Function &newFunction, BranchProbabilityInfo &bpi) {
  
  std::vector<BasicBlock *> OldBlockOrder;
  std::map<std::string, uint64_t> OldBlockIdx;
  size_t I = 0;
  for (BasicBlock &BB : oldFunction) {
    OldBlockOrder.emplace_back(&BB);
    OldBlockIdx[extractAndFormatDigits(BB.getName().str())] = I++;
  }
  computeBlockHashes(oldFunction, 1);

  std::vector<BasicBlock *> NewBlockOrder;
  for (BasicBlock &BB : newFunction) {
    NewBlockOrder.emplace_back(&BB);
  }
  computeBlockHashes(newFunction, 0);

  FlowFunction Func = createFlowFunction(NewBlockOrder, bpi);
  size_t numBlocks = Func.Blocks.size();
  assert(numBlocks == NewBlockOrder.size() + 1);

  std::vector<FlowBlock *> Blocks;
  std::vector<BlendedBlockHash> BlendedHashes;
  for (uint64_t I = 0; I < NewBlockOrder.size(); I++) {
    const BasicBlock *BB = NewBlockOrder[I];
    assert(new_blocks_hash.lookup(BB) != 0 && "empty hash of BinaryBasicBlock");
    Blocks.push_back(&Func.Blocks[I + 1]);
    BlendedBlockHash BlendedHash(new_blocks_hash.lookup(BB));
    BlendedHashes.push_back(BlendedHash);
  }
  StaleMatcher Matcher;
  Matcher.init(Blocks, BlendedHashes);

  // Index in yaml profile => corresponding (matched) block
  DenseMap<uint64_t, const FlowBlock *> MatchedBlocks;
  // Match blocks from the profile to the blocks in CFG
  for (const BasicBlock *BB : OldBlockOrder) {
    assert(old_blocks_hash.lookup(BB) != 0 && "empty hash of BinaryBasicBlockProfile");
    BlendedBlockHash YamlHash(old_blocks_hash.lookup(BB));
    const FlowBlock *MatchedBlock = Matcher.matchBlock(YamlHash);
    // Always match the entry block.
    if (MatchedBlock == nullptr && BB->isEntryBlock() == 0)
      MatchedBlock = Blocks[0];
    if (MatchedBlock != nullptr) {
      MatchedBlocks[OldBlockIdx[extractAndFormatDigits(BB->getName().str())]] = MatchedBlock;
      BlendedBlockHash BinHash = BlendedHashes[MatchedBlock->Index - 1];
      // Update matching stats accounting for the matched block.
      if (Debug) {
        if (Matcher.isHighConfidenceMatch(BinHash, YamlHash)) {
          errs() << "  exact match\n";
        } else {
          errs() << "  loose match\n";
        }
      }
    }
    // } else {
    //   LLVM_DEBUG(
    //       dbgs() << "Couldn't match yaml block (bid = " << YamlBB.Index << ")"
    //              << " with hash " << Twine::utohexstr(YamlBB.Hash) << "\n");
    // }
  }

  // Match jumps from old function to new function
  std::vector<uint64_t> OutWeight(numBlocks, 0);
  std::vector<uint64_t> InWeight(numBlocks, 0);

  if (Debug) {
    errs() << "Matching jumps\n\n";
  }
  for (BasicBlock *oldBB : OldBlockOrder) {
    std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
    if (Debug) {
      errs() << "Checking old basic block " << oldBBName << "\n";
    }
    for (auto [succ, freq] : profile[oldBBName]) {
      if (Debug) {
        errs() << "Checking jump " << oldBBName << " -> "
                << succ << " with frequency " << freq << "\n";
      }
      if (freq == 0)
        continue;

      size_t srcIndex = OldBlockIdx[oldBBName];
      size_t dstIndex = OldBlockIdx[succ];

      const FlowBlock *matchedSrcBlock = MatchedBlocks.lookup(srcIndex);
      const FlowBlock *matchedDstBlock = MatchedBlocks.lookup(dstIndex);

      if (matchedSrcBlock != nullptr && matchedDstBlock != nullptr) {
        // find a jump between the two blocks
        if (Debug) {
          errs() << "Blocks matched, trying to find equivalent jump\n";
        }
        FlowJump *jump = nullptr;
        for (FlowJump *succJump : matchedSrcBlock->SuccJumps) {
          if (succJump->Target == matchedDstBlock->Index) {
            if (Debug) {
              errs() << "Jump found\n\n";
            }
            jump = succJump;
            break;
          }
        }

        if (jump != nullptr) {
          if (Debug) {
            errs() << "Jump not found\n\n";
          }
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
  for (FlowBlock &Block : Func.Blocks) {
    if (OutWeight[Block.Index] == 0 && InWeight[Block.Index] == 0) {
      assert(Block.HasUnknownWeight && "unmatched block with a positive count");
      continue;
    }
    Block.HasUnknownWeight = false;
    Block.Weight = std::max(OutWeight[Block.Index], InWeight[Block.Index]);
  }

  // Use a BFS to find all blocks that are reachable from source and do not
  // have a path to exit, and mark them as cold blocks

  // Start bfs from the source
  std::queue<uint64_t> queue;
  std::vector<bool> visitedEntry(numBlocks, false);
  for (size_t i = 0; i < numBlocks; ++i) {
    FlowBlock &block = Func.Blocks[i];
    if (block.isEntry()) {
      queue.push(i);
      visitedEntry[i] = true;
      break;
    }
  }

  while (!queue.empty()) {
    uint64_t src = queue.front();
    queue.pop();
    for (FlowJump *jump : Func.Blocks[src].SuccJumps) {
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
    FlowBlock &block = Func.Blocks[i];
    if (block.isExit() && visitedEntry[i]) {
      queue.push(i);
      visitedExit[i] = true;
    }
  }
  while (!queue.empty()) {
    const uint64_t src = queue.front();
    queue.pop();
    for (FlowJump *jump : Func.Blocks[src].PredJumps) {
      const uint64_t dst = jump->Source;
      if (!visitedExit[dst]) {
        queue.push(dst);
        visitedExit[dst] = true;
      }
    }
  }

  // Make all blocks of zero weight so that flow is not sent
  for (uint64_t i = 0; i < numBlocks; i++) {
    FlowBlock &block = Func.Blocks[i];
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
  if (Func.Blocks.size() > opts::StaleMatchingMaxFuncSize) {
    outfile << "Function exceeded Max Size\n";
    return;
  }

  bool hasExitBlocks = llvm::any_of(
      Func.Blocks, [&](const FlowBlock &block) { return block.isExit(); });
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
  applyFlowInference(params, Func);

  // Assign inferred profile
  assert(numBlocks == NewBlockOrder.size() + 1);

  BasicBlock *hottestBlock = nullptr;
  uint64_t highestFrequency = 0;

  using bbd = std::pair<BasicBlock *, uint64_t>;
  std::vector<bbd> orderedBlocks;

  for (FlowBlock &block : Func.Blocks) {
    if (block.Index > 0) {
      BasicBlock *matchedBlock = NewBlockOrder[block.Index-1];
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

  for (auto [BB, Freq] : orderedBlocks) {
    auto BBName = extractAndFormatDigits(BB->getName().str());
    outfile << BBName << "\n";
  }
}

// Read a profile file
bool AyupovPass::readProfile(std::string functionName) {
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
    if (Debug) {
      outs() << "Read " << srcBlockName << " -> " << dstBlockName << " : " << frequency << "\n";
    }
    profile[srcBlockName].emplace_back(dstBlockName, frequency);
  }

  profileFile.close();
  return true;
}

FunctionAnalysisManager createFunctionAnalysisManager(Module &M) {
  FunctionAnalysisManager FAM;
  LoopAnalysisManager LAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;
  
  PassBuilder PB;
  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

  return FAM;
}

PreservedAnalyses AyupovPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  std::string functionName = F.getName().str();

  // outs() << "Running on function " << functionName << "\n";
  // if (functionName != "bitstring") return PreservedAnalyses::all();
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

  FunctionAnalysisManager oldAM = createFunctionAnalysisManager(*oldProgram);

  bool foundFunction = false;

  for (Function &fun : *oldProgram) {
    // Project profile from the function with the same name in the old program
    // Check if -O3 don't change function names
    if (fun.getName().str() == functionName) {
      if (Debug) {
        outs() << "Running projection for function " << functionName << "\n\n";
      }
      blocks_profile.clear();
      // outs() << "Starting " << F.getName() << "\n";
      this->projectProfile(fun, F, bpi);
      // outs() << "Finishing " << F.getName() << "\n";

      // foundFunction = true;
      break;
    }
  }


  outfile.close();

  return PreservedAnalyses::all();
}
