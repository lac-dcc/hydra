#include "HBPPredictor.h"
#include <string>
#include <regex>
// #include <cmath>
#include <vector>


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

long double getEdgeProbability(llvm::BranchProbabilityInfo &bpi, BasicBlock *src, BasicBlock *dst) {
    auto EdgeProbability = bpi.getEdgeProbability(src, dst);
    return ((long double)EdgeProbability.getNumerator())/EdgeProbability.getDenominator();
}

// long double approximateConvergence(long double x) {
//     long double ret = 0.0;
//     long double aux = x;
//     for (int i = 1; i <= 10000; i++) {
//         ret += aux;
//         aux *= x;
//     }
//     return ret;
// }

// bool isSuccessorInLoop(llvm::LoopInfo &li, BasicBlock *src, BasicBlock *dst) {
//     return li.getLoopDepth(src) == (li.isLoopHeader(dst))+li.getLoopDepth(dst);
// }

bool isBackEdge(BasicBlock *src, BasicBlock *dst, const llvm::DominatorTree &DT) {
    if (DT.dominates(dst, src)) {
        return true;
    }
    if (auto Next = dst->getUniqueSuccessor()) {
        if (DT.dominates(dst, src)) {
            return true;
        }
    }
    return false;
}

void HBPPredictorPass::propagate(llvm::BranchProbabilityInfo &BPI, const llvm::DominatorTree &DT, BasicBlock *BB, BasicBlock *Head) {
    // outfile << "Propagating BB " << extractAndFormatDigits(BB->getName().str()) << "\n"; 
    const long double eps = 0.05;
    if (vis[BB]) {
        return;
    }
    if (BB == Head) {
        bfreq[BB] = 1;
    } else {
        for (auto *Pred : llvm::predecessors(BB)) {
            if (!vis[Pred] && !isBackEdge(Pred, BB, DT)) {
                return;
            }
        }
        bfreq[BB] = 0;
        long double cyclic_prob = 0;
        for (auto *Pred : llvm::predecessors(BB)) {
            if (isBackEdge(Pred, BB, DT)) {
                cyclic_prob += back_edge_prob[{Pred,BB}];
            } else {
                bfreq[BB] += freq[{Pred, BB}];
            }
        }
        if (cyclic_prob > 1-eps) {
            cyclic_prob = 1-eps;
        }
        bfreq[BB] = bfreq[BB]/(1-cyclic_prob);
    }
    vis[BB] = 1;
    for (auto *Succ : llvm::successors(BB)) {
        freq[{BB,Succ}] = getEdgeProbability(BPI, BB, Succ) * bfreq[BB];
        if (Succ == Head) {
            back_edge_prob[{BB,Succ}] = getEdgeProbability(BPI, BB, Succ) * bfreq[BB];
        }
    }
    for (auto *Succ : llvm::successors(BB)) {
        if (!isBackEdge(BB, Succ, DT)) {
            // outfile << "Edge " << extractAndFormatDigits(BB->getName().str()) << " -> " <<
            // extractAndFormatDigits(Succ->getName().str()) << " is not a back-edge\n";
            propagate(BPI, DT, Succ, Head);
        }
    }
}

void HBPPredictorPass::markVis(BasicBlock *BB) {
    if (!vis[BB]) return;
    vis[BB] = 0;
    for (auto *Succ : llvm::successors(BB)) {
        markVis(Succ);
    }
}

PreservedAnalyses HBPPredictorPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
    
    // const long double eps = 1e-6;

    std::string functionName = F.getName().str();
    outfile.open(functionName + "-predictor.txt");


    llvm::BranchProbabilityInfo &bpi = AM.getResult<llvm::BranchProbabilityAnalysis>(F);
    llvm::LoopInfo &li = AM.getResult<llvm::LoopAnalysis>(F);
    llvm::DominatorTree &dt = AM.getResult<llvm::DominatorTreeAnalysis>(F);

    for (BasicBlock &BB : F) {
        for (auto *Succ : llvm::successors(&BB)) {
            // outfile << "Edge: " << extractAndFormatDigits(BB.getName().str()) << " -> " <<
            // extractAndFormatDigits(Succ->getName().str()) << " | Probability: " <<
            // getEdgeProbability(bpi, &BB, Succ) << "\n";
            back_edge_prob[{&BB,Succ}] = getEdgeProbability(bpi, &BB, Succ);
        }
    }

    std::vector<std::pair<int, BasicBlock *>> Headers;

    for (Loop *l : li.getLoopsInPreorder()) {
        Headers.emplace_back(l->getLoopDepth(), l->getHeader());
    }

    std::sort(Headers.rbegin(), Headers.rend());
    Headers.emplace_back(0,&(F.getEntryBlock()));

    for (auto Header : Headers) {
        BasicBlock *Head = Header.second;
        // outfile << extractAndFormatDigits(Head->getName().str()) << "\n";
        for (BasicBlock &BB : F) {
            vis[&BB] = 1;
        }
        markVis(Head);
        // for (BasicBlock &BB : F) {
        //     outfile << "BB: " << extractAndFormatDigits(BB.getName().str()) << " | " <<
        //     (vis[&BB] ? "" : "Not ") << "Visited\n"; 
        // }
        propagate(bpi, dt, Head, Head);
    }

    long double MaxPred = -1;
    BasicBlock *predicted = nullptr;

    for (BasicBlock &BB : F) {
        // outfile << "BB: " << extractAndFormatDigits(BB.getName().str()) << " | Frequency: " << bfreq[&BB] << "\n";
        if (bfreq[&BB] > MaxPred) {
            MaxPred = bfreq[&BB];
            predicted = &BB;
        }
    }
    
    outfile << extractAndFormatDigits(predicted->getName().str()) << "\n";

    outfile.close();

    return PreservedAnalyses::all();
}