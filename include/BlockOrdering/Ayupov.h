#ifndef BOP_HYDRA_PASS_H
#define BOP_HYDRA_PASS_H

#include <fstream>
#include <map>
#include <vector>

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"

namespace llvm {

/// An object wrapping several components of a basic block hash. The combined
/// (blended) hash is represented and stored as one uint64_t, while individual
/// components are of smaller size (e.g., uint16_t or uint8_t).
struct BlendedBlockHash {
private:
  using ValueOpcode = Bitfield::Element<uint16_t, 0, 16>;
  using ValueInstr = Bitfield::Element<uint16_t, 16, 16>;
  using ValuePred = Bitfield::Element<uint8_t, 32, 8>;
  using ValueSucc = Bitfield::Element<uint8_t, 40, 8>;

public:
  explicit BlendedBlockHash() {}

  explicit BlendedBlockHash(uint64_t Hash) {
    OpcodeHash = Bitfield::get<ValueOpcode>(Hash);
    InstrHash = Bitfield::get<ValueInstr>(Hash);
    PredHash = Bitfield::get<ValuePred>(Hash);
    SuccHash = Bitfield::get<ValueSucc>(Hash);
  }

  /// Combine the blended hash into uint64_t.
  uint64_t combine() const {
    uint64_t Hash = 0;
    Bitfield::set<ValueOpcode>(Hash, OpcodeHash);
    Bitfield::set<ValueInstr>(Hash, InstrHash);
    Bitfield::set<ValuePred>(Hash, PredHash);
    Bitfield::set<ValueSucc>(Hash, SuccHash);
    return Hash;
  }

  /// Compute a distance between two given blended hashes. The smaller the
  /// distance, the more similar two blocks are. For identical basic blocks,
  /// the distance is zero.
  uint64_t distance(const BlendedBlockHash &BBH) const {
    assert(OpcodeHash == BBH.OpcodeHash &&
           "incorrect blended hash distance computation");
    uint64_t Dist = 0;
    // Account for NeighborHash
    Dist += SuccHash == BBH.SuccHash ? 0 : 1;
    Dist += PredHash == BBH.PredHash ? 0 : 1;
    Dist <<= 16;
    // Account for InstrHash
    Dist += InstrHash == BBH.InstrHash ? 0 : 1;
    Dist <<= 16;
    return Dist;
  }

  /// (Loose) Hash of the basic block instructions, excluding operands.
  uint16_t OpcodeHash{0};
  /// (Strong) Hash of the basic block instructions, including opcodes and
  /// operands.
  uint16_t InstrHash{0};
  /// (Loose) Hashes of the predecessors of the basic block.
  uint8_t PredHash{0};
  /// (Loose) Hashes of the successors of the basic block.
  uint8_t SuccHash{0};
};

class AyupovPass : public PassInfoMixin<AyupovPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
private:
    std::ofstream outfile;
    std::ifstream profileFile;

    std::map<std::string, std::vector<std::pair<std::string, uint64_t>>> profile;
    std::map<std::string, uint64_t> blocks_profile;
    std::map<std::string, std::vector<std::pair<std::string, uint64_t>>> new_profile;
    DenseMap<BasicBlock *, uint64_t> old_blocks_hash; 
    DenseMap<BasicBlock *, uint64_t> new_blocks_hash;

    void computeBlockHashes(Function &F, bool old);
    void projectProfile(Function &oldFunction, Function &newFunction, BranchProbabilityInfo &bpi);
    bool readProfile(std::string functionName);
};

}


#endif //BOP_HYDRA_PASS_H