#ifndef BLOCK_BLOCK_MATCHING_H
#define BLOCK_BLOCK_MATCHING_H

#include <vector>
#include "llvm/IR/BasicBlock.h"
#include "OpcodeHistogram.h"
#include <cmath>

// using namespace llvm;



namespace llvm {
namespace Block {

typedef std::shared_ptr<OpcodeHistogram> OHPt;
#define mOHPt(x) std::make_shared<OpcodeHistogram>(x)

class BlockMatching {
private:
  OHPt BlockHistogram;
  OHPt SuccsHistogram;
  OHPt PredsHistogram;
  size_t NumSuccs, NumPreds;
  double DistanceMatched;
public:
  explicit BlockMatching() {}

  explicit BlockMatching(OHPt _BlockHistogram,
                         OHPt _SuccsHistograms, size_t _NumSuccs,
                         OHPt _PredsHistograms, size_t _NumPreds) :
  BlockHistogram(_BlockHistogram), SuccsHistogram(_SuccsHistograms),
  PredsHistogram(_PredsHistograms), NumSuccs(_NumSuccs), NumPreds(_NumPreds),
  DistanceMatched(1e18) {}

  explicit BlockMatching(OHPt _BlockHistogram,
                         const std::vector<OHPt> &_SuccsHistograms,
                         const std::vector<OHPt> &_PredsHistograms) {
    BlockHistogram = _BlockHistogram;
    NumSuccs = _SuccsHistograms.size();
    NumPreds = _PredsHistograms.size();
    SuccsHistogram = mOHPt();
    PredsHistogram = mOHPt();
    for (auto Successor : _SuccsHistograms) {
      *SuccsHistogram += *Successor;
    }
    for (auto Pred : _PredsHistograms) {
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

  double distance(std::shared_ptr<BlockMatching> BM, uint64_t Threshold) const {
    uint64_t BlockDistance = BlockHistogram->distance2(BM->BlockHistogram);
    if (BlockDistance > Threshold) return 1e18+5;
    double SuccDistance = SuccsHistogram->distance2(BM->SuccsHistogram);
    double PredDistance = PredsHistogram->distance2(BM->PredsHistogram);
    uint64_t DeltaSucc = my_abs(NumSuccs-BM->NumSuccs);
    uint64_t DeltaPred = my_abs(NumPreds-BM->NumPreds);
    // if (Debug && VerboseDebug) {
    //   outs() << "Delta successors: " << DeltaSucc << "\n";
    //   outs() << "Successors Distance: " << SuccDistance << "\n";
    //   outs() << "Delta predecessors: " << DeltaPred << "\n";
    //   outs() << "Predecessors Distance: " << PredDistance << "\n";
    // }
    return BlockDistance + SuccDistance/(DeltaSucc+1.0) + PredDistance/(DeltaPred+1.0) + sqrt(DeltaSucc) + sqrt(DeltaPred);
  }
};

} // namespace SCC

} // namespace LLVM

#endif // BLOCK_BLOCK_MATCHING_H