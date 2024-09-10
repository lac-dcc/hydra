#include "HBPPredictor.h"
#include <string>
#include <regex>
#include <cmath>
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

// Try to approximate the convergence of the somatory
// x^1 + x^2 + ... x^n, with n going to infinity and
// 0 <= x < 1
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

bool isLastInLoop(llvm::LoopInfo &li, BasicBlock *src, BasicBlock *dst) {
    return li.isLoopHeader(dst) && li.getLoopDepth(src)-li.isLoopHeader(src) == li.getLoopDepth(dst);
}

PreservedAnalyses HBPPredictorPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
    
    const double eps = 1e-6;

    std::string functionName = F.getName().str();
    outfile.open(functionName + "-predictor.txt");


    llvm::BranchProbabilityInfo &bpi = AM.getResult<llvm::BranchProbabilityAnalysis>(F);
    llvm::LoopInfo &li = AM.getResult<llvm::LoopAnalysis>(F);
    // llvm::BlockFrequencyInfo &bfi = AM.getResult<llvm::BlockFrequencyAnalysis>(F);

    double MaxPred = -1;
    BasicBlock *predicted = nullptr;

    std::map<BasicBlock *, double> Frequencies;

    auto &EntryBlock = F.getEntryBlock();
    Frequencies[&EntryBlock] = 1.0;

    for (BasicBlock &BB : F) {
        //If BB is a loop header, approximate its frequency based on the probability of entering the loop
        if (li.isLoopHeader(&BB)) {
            for (auto *Succ : llvm::successors(&BB)) {
                auto EdgeProbability = bpi.getEdgeProbability(&BB, Succ);
                double Probability = ((double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
                if (isSuccessorInLoop(li, &BB, Succ)) {
                    Frequencies[&BB] += approximateConvergence(Probability);
                }
            }
        }

        double BlockFrequency = Frequencies[&BB];

        // Propagate the frequency for each successor of the BB based on the probability of entering each edge
        for (auto *Succ : llvm::successors(&BB)) {
            if (!isLastInLoop(li, &BB, Succ)) {
                auto EdgeProbability = bpi.getEdgeProbability(&BB, Succ);
                Frequencies[Succ] += BlockFrequency * ((double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
            }
        }
        
        // Update the answer
        if (BlockFrequency > MaxPred && fabs(BlockFrequency - MaxPred) > eps) {
            MaxPred = BlockFrequency;
            predicted = &BB;
        } else if (fabs(BlockFrequency - MaxPred) <= eps) { 
            // If there is a draw, give preference to loop headers
            if (!li.isLoopHeader(predicted) && li.isLoopHeader(&BB)) {
                predicted = &BB;
            }
        }

        // outfile << "BB: " << removebb(BB.getName().str()) << " | Frequency: " << BlockFrequency << "\n";
    }
    
    outfile << removebb(predicted->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}