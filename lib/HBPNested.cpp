#include "HBPNested.h"
#include <string>
#include <regex>
#include <iostream>

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

PreservedAnalyses HBPNestedPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
    
    

    std::string functionName = F.getName().str();
    outfile.open(functionName + "-nested.txt");

    llvm::LoopInfo &li = AM.getResult<llvm::LoopAnalysis>(F);

    int depth = 0;
    BasicBlock *nested = nullptr;

    for (BasicBlock &BB : F) {
      nested = &BB;
      break;
    }

    for (Loop *l : li.getLoopsInPreorder()) {
        if ((l->getLoopDepth()) > depth) {
            depth = l->getLoopDepth();
            nested = l->getHeader();
        }
    }

    outfile << removebb(nested->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}