#ifndef BLOCK_BLOCK_MATCHER_H
#define BLOCK_BLOCK_MATCHER_H

#include <vector>
#include "llvm/IR/BasicBlock.h"
#include "BlockMatching.h"
#include "../WeightedProfileInference.h"

namespace llvm {
namespace Block {

typedef std::shared_ptr<BlockMatching> BMPt;

class BlockMatcher {
public:
  void init(const std::vector<FlowBlock *> &Blocks,
            const std::vector<BMPt> &BlockMatchings) {
    assert(Blocks.size() == BlockMatchings.size() &&
            "incorrect matcher initialization");
    this->Blocks = Blocks;
    this->BlockMatchings = BlockMatchings;
  }

  std::pair<FlowBlock *, BMPt> matchEntryBlock() {
    FlowBlock *entryBlock  = Blocks[0];
    BMPt entryMatching = BlockMatchings[0];
    entryMatching->Match(-2);
    return std::make_pair(entryBlock, entryMatching);
  }

  std::pair<FlowBlock *, BMPt > matchBlock(BMPt BM, unsigned Threshold, std::string OldBBName) const {
    FlowBlock *BestBlock = nullptr;
    BMPt MatchedBlock = nullptr;

    const double eps = 1e-9;
    double BestDistance = 1e18+5;

    FlowBlock *Block = nullptr;
    BMPt Matching = nullptr;
    for (size_t I = 0; I < Blocks.size(); ++I) {
      Block = Blocks[I];
      Matching = BlockMatchings[I];
    //   if (Debug) {
    //     std::cout << "Computing distance between " << Block->Index << " and " << OldBBName << "\n";
    //   }
      double CurrentDistance = Matching->distance(BM, Threshold);
    //   if (Debug) {
    //     std::cout << "Distance: " << CurrentDistance << "\n\n";
    //   }
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
  std::vector<BMPt> BlockMatchings;
};

} // namespace SCC

} // namespace LLVM

#endif // BLOCK_BLOCK_MATCHER_H