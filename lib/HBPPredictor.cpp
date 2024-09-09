#include "HBPPredictor.h"
#include <string>
#include <regex>
#include <map>

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

double approximateConvergence(double x) {
    double ret = 0.0;
    double aux = x;
    for (int i = 1; i <= 10000; i++) {
        ret += aux;
        aux *= x;
    }
    return ret;
}

bool isSuccessorInLoop(llvm::LoopInfo &li, BasicBlock *src, BasicBlock *dst) {
    return li.getLoopDepth(src) == (li.isLoopHeader(dst))+li.getLoopDepth(dst);
}

PreservedAnalyses HBPPredictorPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
    
    

    std::string functionName = F.getName().str();
    outfile.open(functionName + "-predictor.txt");


    llvm::BranchProbabilityInfo &bpi = AM.getResult<llvm::BranchProbabilityAnalysis>(F);
    llvm::LoopInfo &li = AM.getResult<llvm::LoopAnalysis>(F);
    // llvm::BlockFrequencyInfo &bfi = AM.getResult<llvm::BlockFrequencyAnalysis>(F);

    int MaxPred = -1;
    BasicBlock *predicted = nullptr;

    std::map<BasicBlock *, double> Frequencies;
    std::set<BasicBlock *> LoopHeaders;

    auto &EntryBlock = F.getEntryBlock();
    Frequencies[&EntryBlock] = 1.0;

    for (BasicBlock &BB : F) {
        double BlockFrequency = Frequencies[&BB];

        if (li.isLoopHeader(&BB)) {
            for (auto *Succ : llvm::successors(&BB)) {
                auto EdgeProbability = bpi.getEdgeProbability(&BB, Succ);
                double Probability = ((double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
                if (isSuccessorInLoop(li, &BB, Succ)) {
                    Frequencies[&BB] += approximateConvergence(Probability);
                    Frequencies[Succ] = Frequencies[&BB];
                } else {
                    Frequencies[Succ] += BlockFrequency * Probability;
                }
            }
        } else {
            for (auto *Succ : llvm::successors(&BB)) {
                auto EdgeProbability = bpi.getEdgeProbability(&BB, Succ);
                Frequencies[Succ] += BlockFrequency * ((double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
            }
        }

        BlockFrequency = Frequencies[&BB];

        if (BlockFrequency > MaxPred) {
            MaxPred = BlockFrequency;
            predicted = &BB;
        }

        // int BlockFrequency = (&BB \== &EntryBlock ? EntryBlockFrequency : bfi.getBlockFreq(&BB).getFrequency());
        // outfile << removebb(BB.getName().str()) << " " << BlockFrequency << "\n";
        // for (auto *Succ : llvm::successors(&BB)) {
        //   auto EdgeProbability = bpi.getEdgeProbability(&BB, Succ);
        //   auto EdgeFrequency = BlockFrequency * EdgeProbability.getNumerator() / EdgeProbability.getDenominator();
        //   outfile << "Edge: " << removebb(BB.getName().str())  << " -> " << removebb(Succ->getName().str())
        //           << " | Probability: " << ((double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator() << "\n";
        // }
        // if (BlockFrequency > max_pred) {
        //     max_pred = BlockFrequency;
        //     predicted = &BB;
        // }
    }
    
    outfile << removebb(predicted->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}