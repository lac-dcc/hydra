#include "Hydra.h"
#include "WeightedProfileInference.h"
#include "SCC.h"
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

struct BlockMatching {
private:
  OpcodeHistogram *BlockHistogram;
  OpcodeHistogram *SuccsHistogram;
  OpcodeHistogram *PredsHistogram;
  size_t NumSuccs, NumPreds;
  double DistanceMatched;
public:
  explicit BlockMatching() {}

  explicit BlockMatching(OpcodeHistogram *_BlockHistogram,
                         OpcodeHistogram *_SuccsHistograms, size_t _NumSuccs,
                         OpcodeHistogram *_PredsHistograms, size_t _NumPreds) :
  BlockHistogram(_BlockHistogram), SuccsHistogram(_SuccsHistograms),
  PredsHistogram(_PredsHistograms), NumSuccs(_NumSuccs), NumPreds(_NumPreds),
  DistanceMatched(1e18) {}

  explicit BlockMatching(OpcodeHistogram *_BlockHistogram,
                         const std::vector<OpcodeHistogram *> &_SuccsHistograms,
                         const std::vector<OpcodeHistogram *> &_PredsHistograms) {
    BlockHistogram = _BlockHistogram;
    NumSuccs = _SuccsHistograms.size();
    NumPreds = _PredsHistograms.size();
    SuccsHistogram = new OpcodeHistogram();
    PredsHistogram = new OpcodeHistogram();
    for (OpcodeHistogram *Successor : _SuccsHistograms) {
      *SuccsHistogram += *Successor;
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
    if (Debug && VerboseDebug) {
      outs() << "Block Distance: " << BlockDistance << "\n";
    }
    if (BlockDistance > Threshold) return 1e18+5;
    double SuccDistance = SuccsHistogram->distance2(BM.SuccsHistogram);
    double PredDistance = PredsHistogram->distance2(BM.PredsHistogram);
    uint64_t DeltaSucc = abs(NumSuccs-BM.NumSuccs);
    uint64_t DeltaPred = abs(NumPreds-BM.NumPreds);
    if (Debug && VerboseDebug) {
      outs() << "Delta successors: " << DeltaSucc << "\n";
      outs() << "Successors Distance: " << SuccDistance << "\n";
      outs() << "Delta predecessors: " << DeltaPred << "\n";
      outs() << "Predecessors Distance: " << PredDistance << "\n";
    }
    return BlockDistance + SuccDistance/(DeltaSucc+1.0) + PredDistance/(DeltaPred+1.0) + sqrt(DeltaSucc) + sqrt(DeltaPred);
  }
};

class BlockMatcher {
public:
  void init(const std::vector<FlowBlock *> &Blocks,
            const std::vector<BlockMatching *> &BlockMatchings) {
    this->Blocks = Blocks;
    // this->Blocks = Blocks;
    this->BlockMatchings = BlockMatchings;
    assert(this->Blocks.size() == this->BlockMatchings.size() &&
            "incorrect matcher initialization");
  }

  std::pair<FlowBlock *, BlockMatching *> matchEntryBlock() {
    FlowBlock *entryBlock  = Blocks[0];
    BlockMatching *entryMatching = BlockMatchings[0];
    entryMatching->Match(-1);
    return std::make_pair(entryBlock, entryMatching);
  }

  std::pair<FlowBlock *, BlockMatching *> matchBlock(BlockMatching &BM, unsigned Threshold) const {
    FlowBlock *BestBlock = nullptr;
    BlockMatching *MatchedBlock = nullptr;

    const double eps = 1e-9;
    double BestDistance = 1e18+5;

    FlowBlock *Block = nullptr;
    BlockMatching *Matching = nullptr;
    for (size_t I = 0; I < Blocks.size(); ++I) {
      Block = Blocks[I];
      Matching = BlockMatchings[I];
      double CurrentDistance = Matching->distance(BM, Threshold);
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
        outs() << "Computing distance between " << Block->Index << " and " << OldBBName << "\n";
      }
      double CurrentDistance = Matching->distance(BM, Threshold);
      if (Debug) {
        outs() << "Distance: " << CurrentDistance << "\n\n";
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


FlowFunction createFlowFunction(std::vector<SCC *> &SCCs, SCC *SuperSCC) {
  FlowFunction Func;

  // Add a special "dummy" source so that there is always a unique entry point.
  // Because of the extra source, for all other blocks in FlowFunction it holds
  // that Block.Index == BB->getIndex() + 1
  FlowBlock EntryBlock;
  EntryBlock.Index = 0;
  Func.Blocks.push_back(EntryBlock);

  // Create FlowBlock for every basic block in the binary function
  std::map<SCC *, size_t> SCCIndex;
  for (SCC *Comp : SCCs) {
    Func.Blocks.emplace_back();
    FlowBlock &Block = Func.Blocks.back();
    Block.Index = Func.Blocks.size() - 1;
    SCCIndex[Comp] = Block.Index;
    // (void)BB;
  }

  // Create FlowJump for each jump between basic blocks in the binary function
  std::vector<uint64_t> InDegree(Func.Blocks.size(), 0);
  for (SCC *SrcComp : SCCs) {
    std::unordered_set<SCC *> UniqueSuccs;
    for (SCC *DstComp : *SrcComp->get_successors()) {
      if (UniqueSuccs.find(DstComp) != UniqueSuccs.end())
        continue;

      Func.Jumps.emplace_back();
      FlowJump &Jump = Func.Jumps.back();
      Jump.Source = SCCIndex[SrcComp];
      Jump.Target = SCCIndex[DstComp];
      InDegree[Jump.Target]++;
      UniqueSuccs.insert(DstComp);
      Func.JumpProbability[&Jump] = 0.5;
      // Func.JumpProbability[&Jump] = getEdgeProbability(bpi, SrcBB, DstBB);
    }
  }

  // Add dummy edges to the extra sources. If there are multiple entry blocks,
  // add an unlikely edge from 0 to the subsequent ones
  assert(InDegree[0] == 0 && "dummy entry blocks shouldn't have predecessors");
  for (uint64_t I = 1; I < Func.Blocks.size(); I++) {
    SCC *Comp = SCCs[I - 1];
    if (Comp->isEntryBlock() || InDegree[I] == 0 || (SuperSCC != nullptr && Comp->get_header() == SuperSCC->get_header())) {
      Func.Jumps.emplace_back();
      FlowJump &Jump = Func.Jumps.back();
      Jump.Source = 0;
      Jump.Target = I;
      if (!Comp->isEntryBlock())
        Jump.IsUnlikely = true;
    }
  }

  // Add a dummy exit block if we are creating a Flow Function for a sub SCC
  if (SuperSCC != nullptr) {
    FlowBlock ExitBlock;
    ExitBlock.Index = Func.Blocks.size();
    Func.Blocks.push_back(ExitBlock);
    for (size_t I = 1; I < Func.Blocks.size()-1; I++) {
      if (SCCs[I-1]->get_exitable()) {
        Func.Jumps.emplace_back();
        FlowJump &Jump = Func.Jumps.back();
        Jump.Source = I;
        Jump.Target = ExitBlock.Index;
      }
    }
    if (Debug) {
      outs() << "Created exit block for " << *SuperSCC << "\n";
    }
  }


  // Create necessary metadata for the flow function
  for (FlowJump &Jump : Func.Jumps) {
    Func.Blocks.at(Jump.Source).SuccJumps.push_back(&Jump);
    Func.Blocks.at(Jump.Target).PredJumps.push_back(&Jump);
  }
  return Func;
}

std::vector<SCC *> computeSCCs(SCC *Comp, Function &F, FunctionAnalysisManager &AM) {
  LoopInfo &li = AM.getResult<llvm::LoopAnalysis>(F);
  DenseMap<BasicBlock *, SCC *> root;
  std::set<SCC *> mergedGraph;
  std::vector<SCC *> compsOrder;
  std::set<SCC *> vis;

  std::vector<Loop *> Loops;
  size_t LoopDepth;
  if (Comp == nullptr) {
    LoopDepth = 0;
    Loops = li.getTopLevelLoops();
  } else {
    Loop *L = li.getLoopFor(Comp->get_header());
    while (L != nullptr && L->getLoopDepth() != Comp->get_depth()) {
      L = L->getParentLoop();
    }

    if (L == nullptr) {
      return {};
    }

    Loops = L->getSubLoops();
    LoopDepth = L->getLoopDepth();
  }

  for (Loop *l : Loops) {
    if (l->getLoopDepth() != LoopDepth+1) continue;
    std::set<BasicBlock *> LoopBlocks;
    std::set<BasicBlock *> LoopPredecessors;
    std::set<BasicBlock *> LoopSucessors;
    bool ExitableBlock = false;
    for (BasicBlock *BB : l->getBlocks()) {
      LoopBlocks.emplace(BB);
    }
    for (BasicBlock *BB : l->getBlocks()) {
      for (BasicBlock *Pred : predecessors(BB)) {
        if (Comp != nullptr && !Comp->contains(Pred)) {continue;}
        if (!LoopBlocks.count(Pred)) {
          LoopPredecessors.emplace(Pred);
        }
      }
      for (BasicBlock *Succ : successors(BB)) {
        if (Comp != nullptr && !Comp->contains(Succ)) {ExitableBlock = true; continue;}
        if (!LoopBlocks.count(Succ)) {
          LoopSucessors.emplace(Succ);
        }
      }
    }
    BasicBlock *header = l->getHeader();
    SCC *L = new SCC(header, LoopBlocks, LoopPredecessors, LoopSucessors, l->getLoopDepth());
    for (BasicBlock *BB : l->getBlocks()) {
      root[BB] = L;
    }
    L->compute_block_histogram();
    if (ExitableBlock) L->set_exitable();
    mergedGraph.emplace(L);
  }

  for (BasicBlock &BB : F) {
    if (Comp != nullptr && !Comp->contains(&BB)) continue;
    if (root[&BB] == nullptr) {
      std::set<BasicBlock *> Blocks;
      std::set<BasicBlock *> Predecessors;
      std::set<BasicBlock *> Successors;
      bool ExitableBlock = false;
      Blocks.emplace(&BB);
      for (BasicBlock *Pred : predecessors(&BB)) {
        if (Comp != nullptr && !Comp->contains(Pred)) continue;
        Predecessors.emplace(Pred);
      }
      for (BasicBlock *Succ : successors(&BB)) {
        if (Comp != nullptr && !Comp->contains(Succ)) {ExitableBlock = true; continue;}
        Successors.emplace(Succ);
      }
      root[&BB] = new SCC(&BB, Blocks, Predecessors, Successors, LoopDepth);
      root[&BB]->compute_block_histogram();
      mergedGraph.emplace(root[&BB]);
      if (ExitableBlock) root[&BB]->set_exitable();
    }
    if (vis.count(root[&BB]))
      continue;
    vis.emplace(root[&BB]);
    compsOrder.emplace_back(root[&BB]);
  }

  for (SCC *SubComp : mergedGraph) {
    if (Comp != nullptr && SubComp->get_header() == Comp->get_header()) SubComp->set_entry_block();
    std::set<OpcodeHistogram *> PredsHistogram;
    std::set<SCC *> Preds;
    std::set<SCC *> Succs;
    for (BasicBlock *Pred : *SubComp->get_predecessors_blocks()) {
      PredsHistogram.emplace(root[Pred]->get_histogram());
      Preds.emplace(root[Pred]);
    }
    SubComp->compute_preds_histogram(PredsHistogram);
    std::set<OpcodeHistogram *> SuccsHistogram; 
    for (BasicBlock *Succ : *SubComp->get_successors_blocks()) {
      SuccsHistogram.emplace(root[Succ]->get_histogram());
      Succs.emplace(root[Succ]);
    }
    SubComp->compute_succs_histogram(SuccsHistogram);
    SubComp->set_predecessors(Preds);
    SubComp->set_successors(Succs);
  }

  return compsOrder;
}

// ======================================

// We need to Rerun this guy with another SCC

void ProfilePass::projectProfile(Function &oldFunction, Function &newFunction, SCC *oldComp, SCC *newComp, FunctionAnalysisManager &AM) {
  if (Debug) {
    if (oldComp != nullptr) {
      outs() << "Running with old sub SCC " << *oldComp << "\n";
    } else {
      outs() << "Running without old sub SCC\n";
    }
    if (newComp != nullptr) {
      outs() << "Running with new sub SCC " << *newComp << "\n";
    } else {
      outs() << "Running without new sub SCC\n";
    }
  }
  if ((oldComp == nullptr && newComp != nullptr) || (oldComp != nullptr && newComp == nullptr)) return;
  std::vector<SCC *> oldCompsOrder = computeSCCs(oldComp, oldFunction, AM);
  std::vector<SCC *> newCompsOrder = computeSCCs(newComp, newFunction, AM);

  if (oldCompsOrder.size() == 0 || newCompsOrder.size() == 0) {
    if (Debug) {
      outs() << "Something strange found on the loops... continuing\n";
    }
    return;
  }

  std::map<std::string, size_t> oldBlockIndex, newBlockIndex;

  FlowFunction flowFunc = createFlowFunction(newCompsOrder, newComp);
  size_t numBlocks = flowFunc.Blocks.size();

  std::vector<FlowBlock *> blocks;

  for (size_t i = 0; i < oldCompsOrder.size(); ++i) {
    oldBlockIndex[extractAndFormatDigits(oldCompsOrder[i]->get_header_name())] = i;
  }

  for (size_t i = 0; i < newCompsOrder.size(); ++i) {
    if (Debug) {
      outs() << *newCompsOrder[i] << " has index " << i+1 << "\n";
    }
    newBlockIndex[extractAndFormatDigits(newCompsOrder[i]->get_header_name())] = i;
    blocks.push_back(&flowFunc.Blocks[i+1]);
  }

  std::vector<BlockMatching *> blockMatchingsAddresses;
  
  for (size_t i = 0; i < newCompsOrder.size(); ++i) {
    BlockMatching *newMatching = new BlockMatching(
      newCompsOrder[i]->get_histogram(),
      newCompsOrder[i]->get_successors_histogram(),
      newCompsOrder[i]->get_successors_blocks()->size(),
      newCompsOrder[i]->get_predecessors_histogram(),
      newCompsOrder[i]->get_predecessors_blocks()->size()
    );
    blockMatchingsAddresses.push_back(newMatching);
  }

  DenseMap<uint64_t, FlowBlock *> matchedBlocks;
  DenseMap<uint64_t, BlockMatching *> matchings;
  DenseMap<uint64_t, double> matchedDistances;

  BlockMatcher BM;
  BM.init(blocks, blockMatchingsAddresses);

  for (int I = 1; I <= MaxIterations; I++) {
    for (size_t oldIdx = 0; oldIdx < oldCompsOrder.size(); oldIdx++) {
      if (matchings.lookup(oldIdx) != nullptr) continue;
      // SCC *oldComp = oldCompsOrder[oldIdx];
      BlockMatching oldMatching(
        oldCompsOrder[oldIdx]->get_histogram(),
        oldCompsOrder[oldIdx]->get_successors_histogram(),
        oldCompsOrder[oldIdx]->get_successors_blocks()->size(),
        oldCompsOrder[oldIdx]->get_predecessors_histogram(),
        oldCompsOrder[oldIdx]->get_predecessors_blocks()->size()
      );
      FlowBlock *matchedBlock = nullptr;
      BlockMatching *matching = nullptr;

      std::tie(matchedBlock, matching) = BM.matchBlock(oldMatching, MatchingThreshold);

      if (matchedBlock == nullptr && oldIdx == 0) {
        std::tie(matchedBlock, matching) = BM.matchEntryBlock();
      }
  
      if (matchedBlock != nullptr) {
        if (I == MaxIterations && oldIdx == 0) {
          matching->Match(-1);
        }
        matchedBlocks[oldIdx] = matchedBlock;
        matchings[oldIdx] = matching;
        matchedDistances[oldIdx] = matching->getDistance();
      }
    }
    for (size_t oldIdx = 0; oldIdx < oldCompsOrder.size(); oldIdx++) {
      FlowBlock *matchedBlock = matchedBlocks.lookup(oldIdx);
      BlockMatching *matching = matchings.lookup(oldIdx);
      double matchedDistance = matchedDistances.lookup(oldIdx);

      if (matching != nullptr) {
        if (matching->getDistance() < matchedDistance) {
          matchedBlocks[oldIdx] = nullptr;
          matchings[oldIdx] = nullptr;
          matchedDistance = 1e18;
        }
      }
    }
  }

  if (Debug) {
    for (size_t oldIdx = 0; oldIdx < oldCompsOrder.size(); oldIdx++) {
      if (matchedBlocks[oldIdx] == nullptr) {
        outs() << *oldCompsOrder[oldIdx] << " not matched\n";
      } else {
        outs() << *oldCompsOrder[oldIdx] << " matched with " << *newCompsOrder[matchedBlocks[oldIdx]->Index-1] << "\n";
      }
    }
  }
  // Match jumps from old function to new function
  std::vector<uint64_t> OutWeight(numBlocks, 0);
  std::vector<uint64_t> InWeight(numBlocks, 0);

  for (size_t oldIdx = 0; oldIdx < oldCompsOrder.size(); oldIdx++) {
    std::string oldCompName = extractAndFormatDigits(oldCompsOrder[oldIdx]->get_header_name());
    if (Debug) {
      outs() << "Checking old SCC " << oldCompName << "\n";
    }
    for (auto [succ, freq] : profile[oldCompName]) {
      if (!oldBlockIndex.count(succ) || freq == 0) continue;
      if (oldComp != nullptr && !oldComp->contains(oldCompsOrder[oldBlockIndex[succ]]->get_header())) continue;
      if (Debug) {
        outs() << "Checking jump " << oldCompName << " -> "
        << succ << " with frequency " << freq << "\n";
      }

      size_t srcIndex = oldBlockIndex[oldCompName];
      size_t dstIndex = oldBlockIndex[succ];

      FlowBlock *matchedSrcBlock = matchedBlocks.lookup(srcIndex);
      FlowBlock *matchedDstBlock = matchedBlocks.lookup(dstIndex);

      if (matchedSrcBlock != nullptr && matchedDstBlock != nullptr) {
        // find a jump between the two blocks
        if (Debug) {
          outs() << "Blocks matched, trying to find equivalent jump\n";
        }
        FlowJump *jump = nullptr;
        for (FlowJump *succJump : matchedSrcBlock->SuccJumps) {
          if (succJump->Target == matchedDstBlock->Index) {
            if (Debug) {
              outs() << "Jump found\n\n";
            }
            jump = succJump;
            break;
          }

        }

        if (Debug && jump == nullptr) {
          outs() << "Jump not found\n\n";
        }
        
        if (jump != nullptr) {
          jump->Weight = freq;
          jump->HasUnknownWeight = false;
        }
      } else if (Debug) {
        outs() << "Blocks not matched\n";
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
    if (Block.Index == 0 || Block.Index == flowFunc.Blocks.size()-1) continue;
    if (Debug) {
      outs() << "Assigned " << Block.Weight << " to block " << *newCompsOrder[Block.Index-1] << "\n";
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
    outfile << "Function exceeded Max Size\n";
    return;
  }

  // bool hasExitBlocks = llvm::any_of(
  //     flowFunc.Blocks, [&](const FlowBlock &block) { return block.isExit(); });
  // if (!hasExitBlocks) {
  //   outfile << "Function doesn't have exit blocks\n";
  //   return;
  // }

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
  // assert(numBlocks == newCompsOrder.size() + 1);

  for (size_t oldIndex = 0; oldIndex < oldCompsOrder.size(); oldIndex++) {
    if (oldCompsOrder[oldIndex]->size() <= 1) continue;
    FlowBlock *matchedComp = matchedBlocks.lookup(oldIndex);
    if (matchedComp == nullptr) continue;
    projectProfile(oldFunction, newFunction, oldCompsOrder[oldIndex], newCompsOrder[matchedComp->Index-1], AM);
  }

  using bbd = std::pair<BasicBlock *, uint64_t>;
  std::vector<bbd> orderedBlocks;


  for (FlowBlock &block : flowFunc.Blocks) {
    if (block.Index > 0 && block.Index < flowFunc.Blocks.size()-1) {
      BasicBlock *matchedBlock = newCompsOrder[block.Index-1]->get_header();
      if (matchedBlock != nullptr) {
        std::string blockName = matchedBlock->getName().str();
        if (blocks_profile.count(blockName)) {
          blocks_profile[blockName] += block.Weight;
        } else {
          blocks_profile[blockName] = block.Weight;
        }
        orderedBlocks.emplace_back(matchedBlock, block.Weight);
      }
    }
  }

  if (Debug) {
    std::sort(orderedBlocks.begin(), orderedBlocks.end(), [](bbd &a, bbd &b) {
      auto [aBB, aFreq] = a;
      auto [bBB, bFreq] = b;
      StringRef aName = aBB->getName();
      StringRef bName = bBB->getName();
      return aFreq > bFreq || (aFreq == bFreq && aName < bName);
    });
  
    outs() << "Old profile:\n";
    std::map<BasicBlock *, uint64_t> oldBlockProfile;
    for (auto [srcBBName, aux] : profile) {
      if (oldBlockIndex.count(srcBBName)) {
        for (auto [dstBBName, freq] : aux) {
          if (oldBlockIndex.count(dstBBName)) {
            // outs() << srcBBName << " -> " << dstBBName << ": " << freq << "\n";
            BasicBlock *oldBlock = oldCompsOrder[oldBlockIndex[dstBBName]]->get_header();
            oldBlockProfile[oldBlock] += freq;
          }
        }
      }
    }
    for (auto [BB, Freq] : oldBlockProfile) {
      outs() << BB->getName() << ": " << Freq << "\n";
    }
  
    outs() << "New profile:\n";
    for (auto [BB, Freq] : orderedBlocks) {
      outs() << BB->getName() << ": " << Freq << "\n";
    }
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
    if (Debug) {
      outs() << "Read " << srcBlockName << " -> " << dstBlockName << " : " << frequency << "\n";
    }
    profile[srcBlockName].emplace_back(dstBlockName, frequency);
  }

  profileFile.close();
  return true;
}

PreservedAnalyses ProfilePass::run(Function &F,
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

  bool foundFunction = false;

  for (Function &fun : *oldProgram) {
    // Project profile from the function with the same name in the old program
    // Check if -O3 don't change function names
    if (fun.getName().str() == functionName) {
      if (Debug) {
        outs() << "Running projection for function " << functionName << "\n\n";
      }
      blocks_profile.clear();
      this->projectProfile(fun, F, nullptr, nullptr, AM);
      using sd = std::pair<std::string, uint64_t>;
      std::vector<sd> orderedBlocks;
      for (BasicBlock &BB : F) {
        std::string bbName = BB.getName().str();
        uint64_t freq;
        if (blocks_profile.count(bbName)) {
          freq = blocks_profile[bbName];
        } else {
          freq = 0;
        }
        orderedBlocks.emplace_back(extractAndFormatDigits(bbName),freq);
      }
      std::sort(orderedBlocks.begin(), orderedBlocks.end(), [](sd &a, sd &b) {
        auto [aName, aFreq] = a;
        auto [bName, bFreq] = b;
        return aFreq > bFreq || (aFreq == bFreq && aName < bName);
      });

      for (auto [name, freq] : orderedBlocks) {
        outfile << name << "\n";
      }

      foundFunction = true;
      break;
    }
  }


  outfile.close();

  return PreservedAnalyses::all();
}