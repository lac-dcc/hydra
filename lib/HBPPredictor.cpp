#include "HBPPredictor.h"
#include <string>
#include <regex>

using namespace llvm;

std::string removebb(const std::string &s) {
  std::string sub = std::regex_replace(s, std::regex(R"([\D])"), "");
  if (sub.size() > 0) {
    if (std::regex_match(s, std::regex(".*crit.*"))) {
      return "-" + sub;
    }
    return sub;
  }
  return "0";
}

PreservedAnalyses HBPPredictorPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
    
    

    std::string functionName = F.getName().str();
    outfile.open(functionName + "-predictor.txt");


    // llvm::BranchProbabilityInfo &bpi = AM.getResult<llvm::BranchProbabilityAnalysis>(F);
    // llvm::LoopInfo &li = AM.getResult<llvm::LoopAnalysis>(F);
    llvm::BlockFrequencyInfo &bfi = AM.getResult<llvm::BlockFrequencyAnalysis>(F);

    int max_pred = -1;
    BasicBlock *predicted = nullptr;

    for (BasicBlock &BB : F) {
        int frequency = bfi.getBlockFreq(&BB).getFrequency();
        // outfile << BB.getName().str() << " " << frequency << "\n";
        if (frequency > max_pred) {
            max_pred = frequency;
            predicted = &BB;
        }
    }

    // for (Loop *l : li.getLoopsInPreorder()) {
    //     if (l->getLoopDepth() > depth) {
    //         depth = l->getLoopDepth();
    //         nested = l->getHeader();
    //     }
    // }
    
    outfile << removebb(predicted->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}