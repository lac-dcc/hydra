#ifndef BOP_RANDOM_PASS_H
#define BOP_RANDOM_PASS_H

#include <fstream>
#include <random>

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"

namespace llvm {

class BOPRandomPass : public PassInfoMixin<BOPRandomPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
private:
    std::ofstream outfile;
    std::mt19937 mt{};
};

}


#endif //BOP_RANDOM_PASS_H