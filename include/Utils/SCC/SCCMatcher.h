#ifndef SCC_SCC_MATCHER_H
#define SCC_SCC_MATCHER_H

#include <vector>
#include <map>
#include <set>
#include <limits>
#include "SCC.h"
#include "../WeightedProfileInference.h"

namespace llvm {
namespace SCC {

class SCCMatcher {
public:
  void init(const std::vector<FlowBlock *> &Blocks,
            const std::vector<std::shared_ptr<SCC>> &BlockMatchings) {
    this->Blocks = Blocks;
    // this->Blocks = Blocks;
    this->BlockMatchings = BlockMatchings;
    assert(this->Blocks.size() == this->BlockMatchings.size() &&
            "incorrect matcher initialization");
  }

  std::pair<FlowBlock *, std::shared_ptr<SCC>> matchEntryBlock() {
    FlowBlock *entryBlock  = Blocks[0];
    std::shared_ptr<SCC> entryMatching = BlockMatchings[0];
    entryMatching->Match(-1);
    return std::make_pair(entryBlock, entryMatching);
  }

  std::pair<FlowBlock *, std::shared_ptr<SCC>> matchBlock(std::shared_ptr<SCC> BM, unsigned Threshold) const {
    FlowBlock *BestBlock = nullptr;
    std::shared_ptr<SCC> MatchedBlock = nullptr;

    double BestDistance = std::numeric_limits<double>::infinity();

    FlowBlock *Block = nullptr;
    std::shared_ptr<SCC> Matching = nullptr;
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

  std::pair<FlowBlock *, std::shared_ptr<SCC>> matchBlock(std::shared_ptr<SCC> BM, unsigned Threshold, std::string OldBBName) const {
    FlowBlock *BestBlock = nullptr;
    std::shared_ptr<SCC> MatchedBlock = nullptr;

    double BestDistance = std::numeric_limits<double>::infinity();

    FlowBlock *Block = nullptr;
    std::shared_ptr<SCC> Matching = nullptr;
    for (size_t I = 0; I < Blocks.size(); ++I) {
      Block = Blocks[I];
      Matching = BlockMatchings[I];
    //   if (Debug) {
    //     outs() << "Computing distance between " << Block->Index << " and " << OldBBName << "\n";
    //   }
      double CurrentDistance = Matching->distance(BM, Threshold);
    //   if (Debug) {
    //     outs() << "Distance: " << CurrentDistance << "\n\n";
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
  std::vector<std::shared_ptr<SCC>> BlockMatchings;
};

} // namespace SCC

} // namespace llvm

#endif // SCC_SCC_MATCHER_H