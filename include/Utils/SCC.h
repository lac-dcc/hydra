#ifndef BOP_SCC_H
#define BOP_SCC_H

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

namespace llvm {

class SCC {
public:
  SCC(BasicBlock *_Header, std::set<BasicBlock *> &_Blocks, std::set<BasicBlock *> &Preds, std::set<BasicBlock *> &Succs, size_t _Depth) {
    Header = _Header;
    for (BasicBlock *BB : _Blocks) {
      Blocks.emplace(BB);
    }

    for (BasicBlock *BB : Preds) {
      PredecessorsBlocks.emplace(BB);
    }
    
    for (BasicBlock *BB : Succs) {
      SuccessorsBlocks.emplace(BB);
    }

    BlockHistogram = nullptr;
    PredsHistogram = nullptr;
    SuccsHistogram = nullptr;
    Depth = _Depth;

    EntryBlock = false;
    ExitableBlock = false;
  }

  bool isEntryBlock() {
    for (BasicBlock *BB : Blocks) {
      if (BB->isEntryBlock()) return true;
    }
    return EntryBlock;
  }

  bool contains(BasicBlock *BB) {
    return (Blocks.count(BB) > 0);
  }

  BasicBlock *get_header() {
    return Header;
  }

  std::set<BasicBlock *> *get_predecessors_blocks() {
    return &PredecessorsBlocks;
  }

  std::set<BasicBlock *> *get_successors_blocks() {
    return &SuccessorsBlocks;
  }

  std::set<SCC *> *get_predecessors() {
    return &Predecessors;
  }

  std::set<SCC *> *get_successors() {
    return &Successors;
  }

  void set_predecessors(std::set<SCC *> &Preds) {
    for (SCC * Pred : Preds) {
      Predecessors.emplace(Pred);
    }
  }

  void set_successors(std::set<SCC *> &Succs) {
    for (SCC * Succ : Succs) {
      Successors.emplace(Succ);
    }
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

  OpcodeHistogram *initializeHistogram(std::set<BasicBlock *> &Blocks) {
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
    return new OpcodeHistogram(opcodes, frequency);
  }

  void compute_block_histogram() {
    BlockHistogram = initializeHistogram(Blocks);
  }

  OpcodeHistogram *get_histogram() {
    return BlockHistogram;
  }

  void compute_preds_histogram(std::set<OpcodeHistogram *> Preds) {
    PredsHistogram = new OpcodeHistogram();
    for (OpcodeHistogram *Pred : Preds) {
      *PredsHistogram += *Pred;
    }
  }

  OpcodeHistogram *get_predecessors_histogram() {
    return PredsHistogram;
  }

  void compute_succs_histogram(std::set<OpcodeHistogram *> Succs) {
    SuccsHistogram = new OpcodeHistogram();
    for (OpcodeHistogram *Succ : Succs) {
      *SuccsHistogram += *Succ;
    }
  }

  OpcodeHistogram *get_successors_histogram() {
    return SuccsHistogram;
  }

  size_t get_depth() {
    return Depth;
  }

  size_t size() {
    return Blocks.size();
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

private:
  BasicBlock *Header;
  std::set<BasicBlock *> Blocks;
  std::set<BasicBlock *> PredecessorsBlocks;
  std::set<BasicBlock *> SuccessorsBlocks;

  std::set<SCC *> Predecessors;
  std::set<SCC *> Successors;

  OpcodeHistogram *BlockHistogram;
  OpcodeHistogram *PredsHistogram;
  OpcodeHistogram *SuccsHistogram;

  bool EntryBlock;
  bool ExitableBlock;

  size_t Depth;
};

}



#endif // BOP_SCC_H