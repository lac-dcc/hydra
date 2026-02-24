#include "Profile.h"
#include "WeightedProfileInference.h"
#include <string>
#include <queue>
#include <unordered_set>
#include <cmath>
#include <limits>
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/Bitfields.h"
#include "llvm/ADT/Hashing.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/xxhash.h"

#define DEBUG_TYPE "hydra-profile"

using namespace llvm;

// NOTE: These cl::opt names ("prog", "prof", "d") conflict with those defined
// in HashMatching.cpp and HistRegion.cpp. Only one of these plugins may be
// loaded per opt invocation. Loading multiple plugins simultaneously will
// cause a command-line option registration abort.
// TODO: Elisa revise this
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
    assert(_Opcodes.size() == _Frequency.size() &&
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

  OpcodeHistogram& operator+=(const OpcodeHistogram &OH) {
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
    return *this;
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

struct BlockMatching {
private:
  OpcodeHistogram *BlockHistogram;   // points into caller's storage
  OpcodeHistogram SuccessorsHistogram; // combined histogram of all successors
  OpcodeHistogram PredsHistogram;      // combined histogram of all predecessors
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
    for (OpcodeHistogram *Successor : _SuccessorsHistograms) {
      SuccessorsHistogram += *Successor;
    }
    for (OpcodeHistogram *Pred : _PredsHistograms) {
      PredsHistogram += *Pred;
    }
    this->DistanceMatched = std::numeric_limits<double>::infinity();
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
    uint64_t BlockDistance = BlockHistogram->distance2(*BM.BlockHistogram);
    LLVM_DEBUG(dbgs() << "Block Distance: " << BlockDistance << "\n");
    if (BlockDistance > Threshold) return std::numeric_limits<double>::infinity();
    double SuccDistance = SuccessorsHistogram.distance2(BM.SuccessorsHistogram);
    double PredDistance = PredsHistogram.distance2(BM.PredsHistogram);
    uint64_t DeltaSucc = (size_t)std::abs((int64_t)NumSuccessors - (int64_t)BM.NumSuccessors);
    uint64_t DeltaPred = (size_t)std::abs((int64_t)NumPreds - (int64_t)BM.NumPreds);
    LLVM_DEBUG(dbgs() << "Delta successors: " << DeltaSucc << "\n"
                      << "Successors Distance: " << SuccDistance << "\n"
                      << "Delta predecessors: " << DeltaPred << "\n"
                      << "Predecessors Distance: " << PredDistance << "\n");
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

    double BestDistance = std::numeric_limits<double>::infinity();

    FlowBlock *Block = nullptr;
    BlockMatching *Matching = nullptr;
    for (size_t I = 0; I < Blocks.size(); ++I) {
      Block = Blocks[I];
      Matching = BlockMatchings[I];
      LLVM_DEBUG(dbgs() << "Computing distance between " << Block->Index
                        << " and " << OldBBName << "\n");
      double CurrentDistance = Matching->distance(BM, Threshold);
      LLVM_DEBUG(dbgs() << "Distance: " << CurrentDistance << "\n");
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
      if (opcode == instOpcode)
        break;
      ++opcodeIdx;
    }
    if (opcodeIdx == opcodes.size()) {
      opcodes.push_back(instOpcode);
      frequency.push_back(1);
    } else {
      frequency[opcodeIdx]++;
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
    newBlockIndex[BB.getName().str()] = newBlockOrder.size();
    newBlockOrder.push_back(&BB);
  }

  // Initialize Flow Function
  FlowFunction flowFunc = createFlowFunction(newBlockOrder, bpi);
  size_t numBlocks = flowFunc.Blocks.size();
  // Initialize histograms

  assert(numBlocks == newBlockOrder.size() + 1);

  std::vector<FlowBlock *> blocks;
  std::vector<OpcodeHistogram> newHistograms, oldHistograms;
  newHistograms.reserve(newBlockOrder.size());
  oldHistograms.reserve(oldBlockOrder.size());

  // Initialize histograms for oldFunction
  LLVM_DEBUG(dbgs() << "Initializing old blocks\n");
  for (size_t i = 0; i < oldBlockOrder.size(); ++i) {
    BasicBlock *BB = oldBlockOrder[i];
    LLVM_DEBUG(dbgs() << "Block at index " << i+1 << ": "
                      << extractAndFormatDigits(BB->getName().str()) << "\n");
    oldHistograms.push_back(initializeHistogram(*BB));
  }

  // Initialize histograms for newFunction
  LLVM_DEBUG(dbgs() << "Initializing new blocks\n");
  for (size_t i = 0; i < newBlockOrder.size(); ++i) {
    BasicBlock *BB = newBlockOrder[i];
    blocks.push_back(&flowFunc.Blocks[i+1]);
    LLVM_DEBUG(dbgs() << "Block at index " << i+1 << ": "
                      << extractAndFormatDigits(BB->getName().str()) << "\n");
    newHistograms.push_back(initializeHistogram(*BB));
  }

  // Build BlockMatching objects
  std::vector<BlockMatching> blockMatchings;
  blockMatchings.reserve(newBlockOrder.size());
  for (size_t i = 0; i < newBlockOrder.size(); ++i) {
    std::vector<OpcodeHistogram *> succHistograms, predHistograms;
    for (BasicBlock *succBB : successors(newBlockOrder[i])) {
      succHistograms.emplace_back(&newHistograms[newBlockIndex[succBB->getName().str()]]);
    }
    for (BasicBlock *predBB : predecessors(newBlockOrder[i])) {
      predHistograms.emplace_back(&newHistograms[newBlockIndex[predBB->getName().str()]]);
    }
    blockMatchings.emplace_back(&newHistograms[i], succHistograms, predHistograms);
  }
  std::vector<BlockMatching *> blockMatchingPtrs;
  blockMatchingPtrs.reserve(blockMatchings.size());
  for (auto &BM : blockMatchings)
    blockMatchingPtrs.push_back(&BM);

  DenseMap<uint64_t, FlowBlock *> matchedBlocks;
  DenseMap<uint64_t, BlockMatching *> matchings;
  DenseMap<uint64_t, double> matchedDistances;

  BlockMatcher BM;
  BM.init(blocks, blockMatchingPtrs);

  // Match blocks from old function to new function
  LLVM_DEBUG(dbgs() << "Matching blocks\n");
  for (int I = 1; I <= (int)MaxIterations; I++) {
    for (BasicBlock *oldBB : oldBlockOrder) {
      std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
      size_t oldBBIndex = oldBlockIndex[oldBBName];

      if (matchings.lookup(oldBBIndex) != nullptr) continue;
      LLVM_DEBUG(dbgs() << "Trying to match block " << oldBBName << "\n");
      std::vector<OpcodeHistogram *> oldSuccHistograms, oldPredHistograms;
      for (BasicBlock *succ : successors(oldBB)) {
        std::string succBBName = extractAndFormatDigits(succ->getName().str());
        oldSuccHistograms.emplace_back(&oldHistograms[oldBlockIndex[succBBName]]);
      }
      for (BasicBlock *pred : predecessors(oldBB)) {
        std::string predBBName = extractAndFormatDigits(pred->getName().str());
        oldPredHistograms.emplace_back(&oldHistograms[oldBlockIndex[predBBName]]);
      }
      BlockMatching oldMatching(&oldHistograms[oldBBIndex], oldSuccHistograms, oldPredHistograms);
      FlowBlock *matchedBlock = nullptr;
      BlockMatching *matching = nullptr;
      std::tie(matchedBlock, matching) = BM.matchBlock(oldMatching, MatchingThreshold, oldBBName);
  
      if (matchedBlock == nullptr && oldBBIndex == 0) {
        std::tie(matchedBlock, matching) = BM.matchEntryBlock();
      }
  
      if (matchedBlock != nullptr) {
        if (I == (int)MaxIterations && oldBBIndex == 0) {
          matching->Match(-1);
        }
        LLVM_DEBUG(dbgs() << "Matched blocks " << oldBBName << " and "
                  << extractAndFormatDigits(newBlockOrder[matchedBlock->Index-1]->getName().str()) << "\n");
        matchedBlocks[oldBBIndex] = matchedBlock;
        matchings[oldBBIndex] = matching;
        matchedDistances[oldBBIndex] = matching->getDistance();
      }
    }
    for (BasicBlock *oldBB : oldBlockOrder) {
      std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
      size_t oldBBIndex = oldBlockIndex[oldBBName];

      BlockMatching *matching = matchings.lookup(oldBBIndex);
      double matchedDistance = matchedDistances.lookup(oldBBIndex);

      if (matching != nullptr) {
        if (matching->getDistance() < matchedDistance) {
          matchedBlocks[oldBBIndex] = nullptr;
          matchings[oldBBIndex] = nullptr;
        }
      }
    }
  }

  // Match jumps from old function to new function
  std::vector<uint64_t> OutWeight(numBlocks, 0);
  std::vector<uint64_t> InWeight(numBlocks, 0);

  LLVM_DEBUG(dbgs() << "Matching jumps\n");
  for (BasicBlock *oldBB : oldBlockOrder) {
    std::string oldBBName = extractAndFormatDigits(oldBB->getName().str());
    LLVM_DEBUG(dbgs() << "Checking old basic block " << oldBBName << "\n");
    for (auto [succ, freq] : profile[oldBBName]) {
      LLVM_DEBUG(dbgs() << "Checking jump " << oldBBName << " -> "
                        << succ << " with frequency " << freq << "\n");
      if (freq == 0)
        continue;

      size_t srcIndex = oldBlockIndex[oldBBName];
      size_t dstIndex = oldBlockIndex[succ];

      FlowBlock *matchedSrcBlock = matchedBlocks.lookup(srcIndex);
      FlowBlock *matchedDstBlock = matchedBlocks.lookup(dstIndex);

      if (matchedSrcBlock != nullptr && matchedDstBlock != nullptr) {
        // find a jump between the two blocks
        LLVM_DEBUG(dbgs() << "Blocks matched, trying to find equivalent jump\n");
        FlowJump *jump = nullptr;
        for (FlowJump *succJump : matchedSrcBlock->SuccJumps) {
          if (succJump->Target == matchedDstBlock->Index) {
            LLVM_DEBUG(dbgs() << "Jump found\n");
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

  using bbd = std::pair<BasicBlock *, uint64_t>;
  std::vector<bbd> orderedBlocks;

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

  for (auto [BB, Freq] : orderedBlocks) {
    auto BBName = extractAndFormatDigits(BB->getName().str());
    outfile << BBName << "\n";
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
    LLVM_DEBUG(dbgs() << "Read " << srcBlockName << " -> " << dstBlockName
                      << " : " << frequency << "\n");
    profile[srcBlockName].emplace_back(dstBlockName, frequency);
  }

  profileFile.close();
  return true;
}

PreservedAnalyses ProfilePass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  std::string functionName = F.getName().str();
  // if (functionName != "bit_shifter") return PreservedAnalyses::all();
  outfile.open(functionName + "-profile.txt");

  if (!this->readProfile(functionName)) {
    outfile << "No profile found for function " << functionName << "\n";
    outfile.close();
    return PreservedAnalyses::all();
  }

  // Parse old program
  LLVMContext context;
  SMDiagnostic err;

  llvm::BranchProbabilityInfo &bpi = AM.getResult<llvm::BranchProbabilityAnalysis>(F);

  std::unique_ptr<Module> oldProgram = parseIRFile(LLFilename, err, context);

  for (Function &fun : *oldProgram) {
    if (fun.getName().str() == functionName) {
      LLVM_DEBUG(dbgs() << "Running projection for function " << functionName << "\n");
      this->projectProfile(fun, F, bpi);
      break;
    }
  }


  outfile.close();

  return PreservedAnalyses::all();
}