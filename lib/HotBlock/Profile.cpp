#include "Profile.h"
#include "WeightedProfileInference.h"
#include <string>
#include <regex>
#include <iostream>
#include <queue>
#include <unordered_map>
#include <unordered_set>
#include <cmath>
#include "llvm/Support/CommandLine.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"



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

  std::pair<size_t, size_t> getHistogramSize() {
    return {Opcodes.size(), Frequency.size()};
  }

  bool isMatched() {
    return Matched;
  }

  void Match() {
    Matched = true;
  }

  const void operator+=(const OpcodeHistogram &OH) {
    std::map<uint32_t, uint64_t> Frequencies;
    std::map<uint32_t, bool> UsedFrequencies;
    for (size_t I = 0; I < OH.Opcodes.size(); I++) {
      Frequencies[OH.Opcodes[I]] = OH.Frequency[I];
      UsedFrequencies[OH.Opcodes[I]] = 0;
    }
    
    for (size_t I = 0; I < Opcodes.size(); I++) {
      Frequency[I] += Frequencies[Opcodes[I]];
      UsedFrequencies[Opcodes[I]] = 1;
    }

    for (const auto [Opcode, Freq] : Frequencies) {
      if (!UsedFrequencies[Opcode]) {
        Opcodes.emplace_back(Opcode);
        Frequency.emplace_back(Freq);
      }
    }
  }

  uint64_t distance2(const OpcodeHistogram *OH) const {
    std::map<uint32_t, int64_t> Frequencies;
    for (size_t I = 0; I < Opcodes.size(); I++) {
      Frequencies[Opcodes[I]] = Frequency[I];
    }
    
    
    for (size_t I = 0; I < OH->Opcodes.size(); I++) {
      if (Frequencies.count(OH->Opcodes[I]) > 0) {
        Frequencies[OH->Opcodes[I]] -= (int64_t)OH->Frequency[I];
      } else {
        Frequencies[OH->Opcodes[I]] = OH->Frequency[I];
      }
    }

    int64_t Distance2 = 0;
    
    for (const auto [Opcode, Freq] : Frequencies) {
      Distance2 += (Freq*Freq);
    }
    
    return (uint64_t)Distance2;
  }

  friend std::ostream &operator<<(std::ostream &os, const OpcodeHistogram &OH) {
    for (int I = 0; I < OH.Opcodes.size(); ++I) {
      os << OH.Opcodes[I] << ": " << OH.Frequency[I] << "\n";
    }
    return os;
  }
};

struct BlockMatching {
private:
  OpcodeHistogram *BlockHistogram;
  OpcodeHistogram *SuccessorsHistogram;
  OpcodeHistogram *PredsHistogram;
  size_t NumSuccessors, NumPreds;
  double DistanceMatched;
public:
  explicit BlockMatching() {}

  explicit BlockMatching(OpcodeHistogram *_BlockHistogram,
                         const std::vector<OpcodeHistogram *> &_SuccessorsHistograms,
                         const std::vector<OpcodeHistogram *> &_PredsHistograms) {
    BlockHistogram = _BlockHistogram;
    NumSuccessors = _SuccessorsHistograms.size();
    NumPreds = _PredsHistograms.size();
    SuccessorsHistogram = new OpcodeHistogram();
    PredsHistogram = new OpcodeHistogram();
    for (OpcodeHistogram *Successor : _SuccessorsHistograms) {
      *SuccessorsHistogram += *Successor;
    }
    for (OpcodeHistogram *Pred : _PredsHistograms) {
      *PredsHistogram += *Pred;
    }
    this->DistanceMatched = 1e18;
  }

  size_t getBlockHistogramSize() {
    return BlockHistogram->getHistogramSize().first;
  }

  double getDistance() {
    return this->DistanceMatched;
  }

  void Match(double Distance) {
    this->DistanceMatched = Distance;
  }

  double distance(const BlockMatching &BM, uint64_t Threshold) const {
    uint64_t BlockDistance = BlockHistogram->distance2(BM.BlockHistogram);
    if (Debug) {
      std::cout << "Block Distance: " << BlockDistance << "\n";
    }
    if (BlockDistance > Threshold) return 1e18+5;
    double SuccDistance = SuccessorsHistogram->distance2(BM.SuccessorsHistogram);
    double PredDistance = PredsHistogram->distance2(BM.PredsHistogram);
    uint64_t DeltaSucc = abs(NumSuccessors-BM.NumSuccessors);
    uint64_t DeltaPred = abs(NumPreds-BM.NumPreds);
    if (Debug) {
      std::cout << "Delta successors: " << DeltaSucc << "\n";
      std::cout << "Successors Distance: " << SuccDistance << "\n";
      std::cout << "Delta predecessors: " << DeltaPred << "\n";
      std::cout << "Predecessors Distance: " << PredDistance << "\n";
    }
    return BlockDistance + SuccDistance/(DeltaSucc+1.0) + PredDistance/(DeltaPred+1.0) + sqrt(DeltaSucc) + sqrt(DeltaPred);
  }
};

class BlockMatcher {
public:
  void init(const std::vector<FlowBlock *> &Blocks,
            const std::vector<BlockMatching *> &BlockMatchings) {
    assert(Blocks.size() == BlockMatchings.size() &&
            "incorrect matcher initialization");
    this->Blocks = Blocks;
    this->BlockMatchings = BlockMatchings;
  }

  std::pair<FlowBlock *, BlockMatching *> matchEntryBlock() {
    FlowBlock *entryBlock  = Blocks[0];
    BlockMatching *entryMatching = BlockMatchings[0];
    entryMatching->Match(-1);
    return std::make_pair(entryBlock, entryMatching);
  }

  std::pair<FlowBlock *, BlockMatching *> matchBlock(BlockMatching &BM, unsigned Threshold, std::string OldBBName) const {
    FlowBlock *BestBlock = nullptr;
    BlockMatching *MatchedBlock = nullptr;

    const double eps = 1e-9;
    double BestDistance = 1e18+5;

    FlowBlock *Block = nullptr;
    BlockMatching *Matching = nullptr;
    for (size_t I = 0; I < Blocks.size(); ++I) {
      Block = Blocks[I];
      Matching = BlockMatchings[I];
      if (Debug) {
        std::cout << "Computing distance between " << Block->Index << " and " << OldBBName << "\n";
      }
      double CurrentDistance = Matching->distance(BM, Threshold);
      if (Debug) {
        std::cout << "Distance: " << CurrentDistance << "\n\n";
      }
      if (CurrentDistance >= Matching->getDistance()) continue;


      if (CurrentDistance < BestDistance) {
        BestDistance = CurrentDistance;
        BestBlock = Block;
        MatchedBlock = Matching;
      }
    }
    
    if (MatchedBlock != nullptr)
      MatchedBlock->Match(BestDistance);
    return std::make_pair(BestBlock, MatchedBlock);
  }
private:
  std::vector<FlowBlock *> Blocks;
  std::vector<BlockMatching *> BlockMatchings;
};

long double getEdgeProbability(BranchProbabilityInfo &bpi, BasicBlock *src, BasicBlock *dst) {
  auto EdgeProbability = bpi.getEdgeProbability(src, dst);
  return ((long double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
}

FlowFunction createFlowFunction(std::vector<BasicBlock *> &BlockOrder, BranchProbabilityInfo &bpi) {
  FlowFunction Func;
  //         << succ << " with frequency " << freq << "\n";

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

OpcodeHistogram *initializeHistogram(BasicBlock &BB) {
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
      frequency[opcodeIdx]++;
    }
  }
  return new OpcodeHistogram(opcodes, frequency);
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
    newBlockIndex[BB.getName().str()] = newBlockOrder.size();
    newBlockOrder.push_back(&BB);
  }

  // Initialize Flow Function
  FlowFunction flowFunc = createFlowFunction(newBlockOrder, bpi);
  size_t numBlocks = flowFunc.Blocks.size();
  // Initialize histograms

  assert(numBlocks == newBlockOrder.size() + 1);

  std::vector<FlowBlock *> blocks;
  std::vector<OpcodeHistogram *> newHistogramsAddresses, oldHistogramsAddresses;

  // Initialize histograms for oldFunction
  if (Debug) {
    std::cout << "Initializing old blocks\n";
  }
  for (size_t i = 0; i < oldBlockOrder.size(); ++i) {
    BasicBlock *BB = oldBlockOrder[i];
    if (Debug) {
      std::cout << "Block at index " << i+1 << ": " <<
        extractAndFormatDigits(BB->getName().str()) << "\n";
    }
    oldHistogramsAddresses.push_back(initializeHistogram(*BB));
  }

  // Initialize histograms for newFunction
  if (Debug) {
    std::cout << "Initializing new blocks\n";
  }
  for (size_t i = 0; i < newBlockOrder.size(); ++i) {
    BasicBlock *BB = newBlockOrder[i];
    blocks.push_back(&flowFunc.Blocks[i+1]);
    if (Debug) {
      std::cout << "Block at index " << i+1 << ": " <<
        extractAndFormatDigits(BB->getName().str()) << "\n";
    }
    newHistogramsAddresses.push_back(initializeHistogram(*BB));
  }

  std::vector<BlockMatching *> blockMatchingsAddresses;

  for (size_t i = 0; i < newBlockOrder.size(); ++i) {
    std::vector<OpcodeHistogram *> succHistograms, predHistograms;
    for (BasicBlock *succBB : successors(newBlockOrder[i])) {
      succHistograms.emplace_back(newHistogramsAddresses[newBlockIndex[succBB->getName().str()]]);
    }
    for (BasicBlock *predBB : predecessors(newBlockOrder[i])) {
      predHistograms.emplace_back(newHistogramsAddresses[newBlockIndex[predBB->getName().str()]]);
    }
    BlockMatching *newMatching = new BlockMatching(newHistogramsAddresses[i], succHistograms, predHistograms);
    blockMatchingsAddresses.push_back(newMatching);
  }

  DenseMap<uint64_t, FlowBlock *> matchedBlocks;
  DenseMap<uint64_t, BlockMatching *> matchings;
  DenseMap<uint64_t, double> matchedDistances;

  BlockMatcher BM;
  BM.init(blocks, blockMatchingsAddresses);

  // Match blocks from old function to new function
  if (Debug) {
    std::cout << "Matching blocks\n\n";
  }
  for (int I = 1; I <= MaxIterations; I++) {
    for (BasicBlock *oldBB : oldBlockOrder) {
      std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
      size_t oldBBIndex = oldBlockIndex[oldBBName];

      if (matchings.lookup(oldBBIndex) != nullptr) continue;
      if (Debug) {
        std::cout << "Trying to match block " << oldBBName << "\n\n";
      }
      OpcodeHistogram *oldHistogram = oldHistogramsAddresses[oldBBIndex];
      std::vector<OpcodeHistogram *> oldSuccHistograms, oldPredHistograms;
      for (BasicBlock *succ : successors(oldBB)) {
        std::string succBBName = extractAndFormatDigits(succ->getName().str());
        oldSuccHistograms.emplace_back(oldHistogramsAddresses[oldBlockIndex[succBBName]]);
      }
      for (BasicBlock *pred : predecessors(oldBB)) {
        std::string predBBName = extractAndFormatDigits(pred->getName().str());
        oldPredHistograms.emplace_back(oldHistogramsAddresses[oldBlockIndex[predBBName]]);
      }
      BlockMatching oldMatching(oldHistogram, oldSuccHistograms, oldPredHistograms);
      FlowBlock *matchedBlock = nullptr;
      BlockMatching *matching = nullptr;
      std::tie(matchedBlock, matching) = BM.matchBlock(oldMatching, MatchingThreshold, oldBBName);
  
      if (matchedBlock == nullptr && oldBBIndex == 0) {
        std::tie(matchedBlock, matching) = BM.matchEntryBlock();
      }
  
      if (matchedBlock != nullptr) {
        if (I == MaxIterations && oldBBIndex == 0) {
          matching->Match(-1);
        }
        if (Debug) {
          std::cout << "Matched blocks " << oldBBName << " and "
                  << extractAndFormatDigits(newBlockOrder[matchedBlock->Index-1]->getName().str()) << "\n\n";
        }
        matchedBlocks[oldBBIndex] = matchedBlock;
        matchings[oldBBIndex] = matching;
        matchedDistances[oldBBIndex] = matching->getDistance();
      }
    }
    for (BasicBlock *oldBB : oldBlockOrder) {
      std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
      size_t oldBBIndex = oldBlockIndex[oldBBName];

      FlowBlock *matchedBlock = matchedBlocks.lookup(oldBBIndex);
      BlockMatching *matching = matchings.lookup(oldBBIndex);
      double matchedDistance = matchedDistances.lookup(oldBBIndex);

      if (matching != nullptr) {
        if (matching->getDistance() < matchedDistance) {
          matchedBlocks[oldBBIndex] = nullptr;
          matchings[oldBBIndex] = nullptr;
          matchedDistance = 1e18;
        }
      }
    }
  }

  // Match jumps from old function to new function
  std::vector<uint64_t> OutWeight(numBlocks, 0);
  std::vector<uint64_t> InWeight(numBlocks, 0);

  if (Debug) {
    std::cout << "Matching jumps\n\n";
  }
  for (BasicBlock *oldBB : oldBlockOrder) {
    std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
    if (Debug) {
      std::cout << "Checking old basic block " << oldBBName << "\n";
    }
    for (auto [succ, freq] : profile[oldBBName]) {
      if (Debug) {
        std::cout << "Checking jump " << oldBBName << " -> "
                << succ << " with frequency " << freq << "\n";
      }
      if (freq == 0)
        continue;

      size_t srcIndex = oldBlockIndex[oldBBName];
      size_t dstIndex = oldBlockIndex[succ];

      FlowBlock *matchedSrcBlock = matchedBlocks.lookup(srcIndex);
      FlowBlock *matchedDstBlock = matchedBlocks.lookup(dstIndex);

      if (matchedSrcBlock != nullptr && matchedDstBlock != nullptr) {
        // find a jump between the two blocks
        if (Debug) {
          std::cout << "Blocks matched, trying to find equivalent jump\n";
        }
        FlowJump *jump = nullptr;
        for (FlowJump *succJump : matchedSrcBlock->SuccJumps) {
          if (succJump->Target == matchedDstBlock->Index) {
            if (Debug) {
              std::cout << "Jump found\n\n";
            }
            jump = succJump;
            break;
          }
        }

        if (jump != nullptr) {
          if (Debug) {
            std::cout << "Jump not found\n\n";
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
  if (Debug) {
    std::cout << "\nAssigning weights to matched blocks\n\n";
  }
  for (FlowBlock &Block : flowFunc.Blocks) {
    if (OutWeight[Block.Index] == 0 && InWeight[Block.Index] == 0) {
      assert(Block.HasUnknownWeight && "unmatched block with a positive count");
      if (Debug) {
        if (Block.Index)
          std::cout << Block.Index-1 << "\n";
          std::cout << extractAndFormatDigits(newBlockOrder[Block.Index-1]->getName().str()) << " : 0\n";
      }
      continue;
    }
    Block.HasUnknownWeight = false;
    Block.Weight = std::max(OutWeight[Block.Index], InWeight[Block.Index]);
    if (Debug) {
      std::cout << extractAndFormatDigits(newBlockOrder[Block.Index-1]->getName().str()) << " : "
              << Block.Weight << "\n";
    }
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
    outfile << "0\n";
    // outfile << "Function exceeded Max Size\n";
    return;
  }

  bool hasExitBlocks = llvm::any_of(
      flowFunc.Blocks, [&](const FlowBlock &block) { return block.isExit(); });
  if (!hasExitBlocks) {
    // outfile << "Function doesn't have exit blocks\n";
    outfile << "0\n";
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

  for (FlowBlock &block : flowFunc.Blocks) {
    if (block.Index > 0) {
      BasicBlock *matchedBlock = newBlockOrder[block.Index-1];
      if (hottestBlock == nullptr || block.Weight > highestFrequency) {
        hottestBlock = matchedBlock;
        highestFrequency = block.Weight;
      }
    }
  }

  assert(hottestBlock != nullptr);
  outfile << extractAndFormatDigits(hottestBlock->getName().str()) << "\n";
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
    if (Debug) {
      std::cout << "Read " << srcBlockName << " -> " << dstBlockName << " : " << frequency << "\n";
    }
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
    // outfile << "No profile found for function " << functionName << "\n";
    outfile << "0\n";
    outfile.close();
    return PreservedAnalyses::all();
  }

  // Parse old program
  LLVMContext context;
  SMDiagnostic err;

  StringRef oldFileName = LLFilename;

  BranchProbabilityInfo &bpi = AM.getResult<BranchProbabilityAnalysis>(F);

  std::unique_ptr<Module> oldProgram = parseIRFile(LLFilename, err, context);

  bool foundFunction = false;

  for (Function &fun : *oldProgram) {
    // Project profile from the function with the same name in the old program
    // Check if -O3 don't change function names
    if (Debug) {
      std::cout << "Running projection for function " << functionName << "\n\n";
    }
    if (fun.getName().str() == functionName) {
      this->projectProfile(fun, F, bpi);
      foundFunction = true;
      break;
    }
  }

  outfile.close();

  return PreservedAnalyses::all();
}