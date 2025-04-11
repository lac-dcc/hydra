#include "Random.h"
#include <string>
#include <regex>

using namespace llvm;

std::string extractAndFormatDigits(const std::string &s) {
  std::string::size_type pos = s.find(".");
  if (pos == std::string::npos) {
    return (s.size() == 2 ? "0" : s.substr(2));
  } else {
    std::string bb1 = s.substr(0,pos), bb2, args, aux;
    bb1 = (bb1.size() == 2 ? "0" : bb1.substr(2));
    aux = s.substr(pos+1);
    if (aux == "loopexit") {
      return bb1+".le";
    }
    pos = aux.find("_");
    bb2 = aux.substr(0,pos);
    args = aux.substr(pos+1);
    bb2 = (bb2.size() == 2 ? "0" : bb2.substr(2));
    if (args == "crit_edge") {
      return bb1+"_"+bb2+".ce";
    } else {
      return bb1+"_"+bb2+"."+args;
    }
  }
  
  return "0";
}

PreservedAnalyses RandomPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {

    std::string functionName = F.getName().str();
    outfile.open(functionName + "-random.txt");

    // std::uniform_int_distribution dist{0, (int)F.size()-1};

    std::vector<BasicBlock *> BasicBlocks;
    for (BasicBlock &BB : F) {
        BasicBlocks.emplace_back(&BB);
    }

    std::shuffle(BasicBlocks.begin(), BasicBlocks.end(), mt);

    for (BasicBlock * BB : BasicBlocks) {
        outfile << extractAndFormatDigits(BB->getName().str()) << "\n";
    }

    outfile.close();

    return PreservedAnalyses::all();
}