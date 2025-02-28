#ifndef BOP_PROFILE_PASS_H
#define BOP_PROFILE_PASS_H

#include <fstream>
#include <map>
#include <vector>

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"

namespace llvm {

class ProfilePass : public PassInfoMixin<ProfilePass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
private:
    std::ofstream outfile;
    std::ifstream profileFile;

    std::map<std::string, std::vector<std::pair<std::string, uint64_t>>> profile;
    std::map<std::string, std::vector<std::pair<std::string, uint64_t>>> new_profile;

    void projectProfile(Function &oldFunction, Function &newFunction);
    bool readProfile(std::string functionName);
};

}


#endif //BOP_PROFILE_PASS_H