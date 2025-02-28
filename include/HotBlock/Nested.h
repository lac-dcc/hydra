#ifndef HBP_NESTED_PASS_H
#define HBP_NESTED_PASS_H

#include <fstream>

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"
#include "llvm/Analysis/LoopInfo.h"

namespace llvm {

class NestedPass : public PassInfoMixin<NestedPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
private:
    std::ofstream outfile;
};

}


#endif //HBP_NESTED_PASS_H