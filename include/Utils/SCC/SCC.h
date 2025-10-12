#ifndef SCC_SCC_H
#define SCC_SCC_H

#include "OpcodeHistogram.h"
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

// using OHPt = std::shared_ptr<OpcodeHistogram>;
size_t my_abs(int x);

namespace llvm {
namespace SCC {

typedef std::shared_ptr<OpcodeHistogram> OHPt;
#define mOHPt(x) std::make_shared<OpcodeHistogram>(x)
    
class SCC {
public:
  SCC(BasicBlock *_Header,
      std::set<BasicBlock *> &_Blocks,
      std::set<BasicBlock *> &Preds,
      std::set<BasicBlock *> &Succs,
      size_t _Depth
    ) :
      Header(_Header),
      PredecessorsBlocks(Preds),
      SuccessorsBlocks(Succs),
      BlockHistogram(mOHPt(initializeHistogram(_Blocks))),
      PredsHistogram(nullptr),
      SuccsHistogram(nullptr),
      Depth(_Depth),
      ExitableBlock(false),
      DistanceMatched(1e18),
      Size(_Blocks.size()) {
      EntryBlock = false;
      for (BasicBlock *BB : _Blocks) {
        BlockNames.emplace(BB->getName());
        if (BB->isEntryBlock()) EntryBlock = true;
      }
    }

  bool isEntryBlock() {
    return EntryBlock;
  }

  bool contains(StringRef Name) {
    return (BlockNames.count(Name) > 0);
  }

  bool contains(BasicBlock *BB) {
    return (BlockNames.count(BB->getName()) > 0);
  }

  BasicBlock *get_header() {
    return Header;
  }

  const std::set<BasicBlock *> &get_predecessors_blocks() const {
    return PredecessorsBlocks;
  }

  const std::set<BasicBlock *> &get_successors_blocks() const {
    return SuccessorsBlocks;
  }

  const std::set<std::shared_ptr<SCC>> &get_predecessors() const {
    return Predecessors;
  }

  const std::set<std::shared_ptr<SCC>> &get_successors() const {
    return Successors;
  }

  void set_predecessors(std::set<std::shared_ptr<SCC>> &Preds) {
    Predecessors = Preds;
  }

  void set_successors(std::set<std::shared_ptr<SCC>> &Succs) {
    Successors = Succs;
  }

  void set_entry_block() {
    EntryBlock = true;
  }

  void set_exitable() {
    ExitableBlock = true;
  }

  bool get_exitable() {
    return ExitableBlock;
  }

  const OHPt &get_histogram() const {
    return BlockHistogram;
  }

  void compute_preds_histogram(std::set<OHPt> &Preds) {
    PredsHistogram = mOHPt();
    for (auto Pred : Preds) {
        *PredsHistogram += *Pred;
    }
  }

  const OHPt &get_predecessors_histogram() const {
    return PredsHistogram;
  }

  void compute_succs_histogram(std::set<OHPt> Succs) {
    SuccsHistogram = mOHPt();
    for (auto Succ : Succs) {
        *SuccsHistogram += *Succ;
    }
  }

  const OHPt &get_successors_histogram() const {
    return SuccsHistogram;
  }

  size_t get_depth() {
    return Depth;
  }

  size_t size() {
    return Size;
  }

  size_t get_successors_size() {
    return SuccessorsBlocks.size();
  }

  size_t get_predecessors_size() {
    return PredecessorsBlocks.size();
  }

  std::string get_header_name() {
    return Header->getName().str();
  }

  friend raw_ostream &operator<<(raw_ostream &os, const SCC &Comp) {
    os << Comp.Header->getName();
    // os << "Strongly Connected component with " << Comp.Blocks.size()
    //    << " blocks, " << Comp.PredecessorsBlocks.size() << " predecessors and "
    //    << Comp.SuccessorsBlocks.size() << " successors\nBlocks: ";
    // for (BasicBlock *BB : Comp.Blocks) {
    //   os << BB->getName() << ", ";
    // }
    // os << "\nSCC histogram: " << *Comp.BlockHistogram;
    // os << "\nPredecessors: ";
    // for (BasicBlock *BB : Comp.PredecessorsBlocks) {
    //   os << BB->getName() << ", ";
    // }
    // os << "\nPredecessors Histogram: " << *Comp.PredsHistogram;
    // os << "\nSuccessors: ";
    // for (BasicBlock *BB : Comp.SuccessorsBlocks) {
    //   os << BB->getName() << ", ";
    // }
    // os << "\nSuccessors Histogram: " << *Comp.SuccsHistogram;
    return os;
  }

  double distance(std::shared_ptr<SCC> Comp, uint64_t Threshold) const {
    uint64_t BlockDistance = BlockHistogram->distance2(Comp->BlockHistogram);
    // if (Debug && VerboseDebug) {
    //   outs() << "Block Distance: " << BlockDistance << "\n";
    // }
    if (BlockDistance > Threshold) return 1e18+5;
    double SuccDistance = SuccsHistogram->distance2(Comp->SuccsHistogram);
    double PredDistance = PredsHistogram->distance2(Comp->PredsHistogram);
    uint64_t DeltaSucc = my_abs(0+this->SuccessorsBlocks.size()-Comp->get_successors_size());
    uint64_t DeltaPred = my_abs(0+this->PredecessorsBlocks.size()-Comp->get_predecessors_size());
    // if (Debug && VerboseDebug) {
    //   outs() << "Delta successors: " << DeltaSucc << "\n";
    //   outs() << "Successors Distance: " << SuccDistance << "\n";
    //   outs() << "Delta predecessors: " << DeltaPred << "\n";
    //   outs() << "Predecessors Distance: " << PredDistance << "\n";
    // }
    return BlockDistance + SuccDistance/(DeltaSucc+1.0) + PredDistance/(DeltaPred+1.0) + sqrt(DeltaSucc) + sqrt(DeltaPred);
  }

  double getDistance() {
    return this->DistanceMatched;
  }

  void Match(double Distance) {
    this->DistanceMatched = Distance;
  }

private:
  BasicBlock *Header;
  std::set<StringRef> BlockNames;
  std::set<BasicBlock *> PredecessorsBlocks;
  std::set<BasicBlock *> SuccessorsBlocks;

  std::set<std::shared_ptr<SCC>> Predecessors;
  std::set<std::shared_ptr<SCC>> Successors;

  OHPt BlockHistogram;
  OHPt PredsHistogram;
  OHPt SuccsHistogram;

  bool EntryBlock;
  bool ExitableBlock;

  double DistanceMatched;

  size_t Depth;
  size_t Size;

  OpcodeHistogram initializeHistogram(std::set<BasicBlock *> &Blocks) {
    DenseMap<uint32_t, uint32_t> frequencies;
    std::vector<uint32_t> opcodes, frequency;
    for (BasicBlock *BB: Blocks) {
      for (Instruction &inst : *BB) {
        unsigned instOpcode = inst.getOpcode();
        frequencies[instOpcode]++;
      }
    }
    for (auto [opcode, freq] : frequencies) {
      opcodes.emplace_back(opcode);
      frequency.emplace_back(freq);
    }
    return OpcodeHistogram(opcodes, frequency);
  }
};

} // namespace SCC

typedef std::shared_ptr<SCC::SCC> SCCPt;

} // namespace LLVM


#endif // SCC_SCC_H