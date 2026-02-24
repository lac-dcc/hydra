#ifndef BLOCK_BLOCK_MATCHING_H
#define BLOCK_BLOCK_MATCHING_H

#include <vector>
#include <limits>
#include "llvm/IR/BasicBlock.h"
#include "OpcodeHistogram.h"
#include <cmath>



namespace llvm {
namespace Block {

typedef std::shared_ptr<OpcodeHistogram> OHPt;
inline OHPt mOHPt() { return std::make_shared<OpcodeHistogram>(); }
inline OHPt mOHPt(OpcodeHistogram x) { return std::make_shared<OpcodeHistogram>(std::move(x)); }

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
  DistanceMatched(std::numeric_limits<double>::infinity()) {}

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

  double distance(std::shared_ptr<BlockMatching> BM, uint64_t Threshold) const {
    uint64_t BlockDistance = BlockHistogram->distance2(BM->BlockHistogram);
    if (BlockDistance > Threshold) return std::numeric_limits<double>::infinity();
    double SuccDistance = SuccsHistogram->distance2(BM->SuccsHistogram);
    double PredDistance = PredsHistogram->distance2(BM->PredsHistogram);
    uint64_t DeltaSucc = (uint64_t)std::abs((int64_t)NumSuccs - (int64_t)BM->NumSuccs);
    uint64_t DeltaPred = (uint64_t)std::abs((int64_t)NumPreds - (int64_t)BM->NumPreds);
    // if (Debug && VerboseDebug) {
    //   outs() << "Delta successors: " << DeltaSucc << "\n";
    //   outs() << "Successors Distance: " << SuccDistance << "\n";
    //   outs() << "Delta predecessors: " << DeltaPred << "\n";
    //   outs() << "Predecessors Distance: " << PredDistance << "\n";
    // }
    return BlockDistance + SuccDistance/(DeltaSucc+1.0) + PredDistance/(DeltaPred+1.0) + sqrt(DeltaSucc) + sqrt(DeltaPred);
  }
};

} // namespace Block

} // namespace llvm

#endif // BLOCK_BLOCK_MATCHING_H