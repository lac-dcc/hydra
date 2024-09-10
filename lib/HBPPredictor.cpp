#include "HBPPredictor.h"
#include <string>
#include <regex>
#include <cmath>
#include <map>

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

double getEdgeProbability(llvm::BranchProbabilityInfo &bpi, BasicBlock *src, BasicBlock *dst) {
    auto EdgeProbability = bpi.getEdgeProbability(src, dst);
    return ((double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
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

    double MaxPred = -1;
    BasicBlock *predicted = nullptr;

    std::map<BasicBlock *, double> Frequencies;

    // Get the entry block and assign an initial frequency to it (e.g. 1)
    auto &EntryBlock = F.getEntryBlock();
    Frequencies[&EntryBlock] = 1.0;

    for (BasicBlock &BB : F) {
        // If BB is a loop header, update its frequency based on the probability of entering the loop
        if (li.isLoopHeader(&BB)) {
            for (auto *Succ : llvm::successors(&BB)) {
                double Probability = getEdgeProbability(bpi, &BB, Succ);
                if (isSuccessorInLoop(li, &BB, Succ)) {
                    Frequencies[&BB] += approximateConvergence(Probability);
                }
            }
        }

        double BlockFrequency = Frequencies[&BB];

        // Propagate the frequency for each successor of the BB based on the probability of entering each edge
        for (auto *Succ : llvm::successors(&BB)) {
            if (!isLastInLoop(li, &BB, Succ)) {
                double Probability = getEdgeProbability(bpi, &BB, Succ);
                Frequencies[Succ] += BlockFrequency * Probability;
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

        // outfile << "BB: " << extractAndFormatDigits(BB.getName().str()) << " | Frequency: " << BlockFrequency << "\n";
    }
    
    outfile << extractAndFormatDigits(predicted->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}