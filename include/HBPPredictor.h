#ifndef HBP_PREDICTOR_PASS_H
#define HBP_PREDICTOR_PASS_H

#include <fstream>

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"

namespace llvm {

class HBPPredictorPass : public PassInfoMixin<HBPPredictorPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
private:
    std::ofstream outfile;
};

}

#endif //HBP_PREDICTOR_PASS_H