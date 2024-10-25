#ifndef HBP_PREDICTOR_PASS_H
#define HBP_PREDICTOR_PASS_H

#include <fstream>
#include <map>
#include <random>

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/BlockFrequencyInfo.h"

namespace llvm {

class HBPPredictorPass : public PassInfoMixin<HBPPredictorPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
    void propagate(llvm::BranchProbabilityInfo &BPI, const llvm::DominatorTree &DT, BasicBlock *BB, BasicBlock *Head);
    void markVis(BasicBlock *BB);
private:
    std::map<std::pair<BasicBlock *, BasicBlock *>, double> freq;
    std::map<std::pair<BasicBlock *, BasicBlock *>, double> back_edge_prob;
    std::map<BasicBlock *, double> bfreq;
    std::map<BasicBlock *, bool> vis;
    std::ofstream outfile;
    std::mt19937 mt{};
};

}

#endif //HBP_PREDICTOR_PASS_H