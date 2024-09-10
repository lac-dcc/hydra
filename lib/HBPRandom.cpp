#include "HBPRandom.h"
#include <string>
#include <regex>

using namespace llvm;

std::string extractAndFormatDigits(const std::string &s) {
  std::string sub = std::regex_replace(s, std::regex(R"([\D])"), "");
  if (sub.size() > 0) {
    if (std::regex_match(s, std::regex(".*crit.*"))) {
      return "-" + sub;
    }
    return sub;
  }
  return "0";
}

PreservedAnalyses HBPRandomPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
    
    std::string functionName = F.getName().str();
    outfile.open(functionName + "-random.txt");

    std::uniform_int_distribution dist{0, (int)F.size()-1};

    std::vector<BasicBlock *> BasicBlocks;
    for (BasicBlock &BB : F) {
        BasicBlocks.emplace_back(&BB);
    }

    outfile << extractAndFormatDigits(BasicBlocks[dist(mt)]->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}