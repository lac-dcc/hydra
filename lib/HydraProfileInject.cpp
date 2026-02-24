//===- HydraProfileInject.cpp - Inject projected profiles into LLVM IR ---===//
//
// This pass loads Hydra's projected edge profiles and injects them as branch
// weight metadata into LLVM IR, enabling profile-guided optimization.
//
//===----------------------------------------------------------------------===//

#include "HydraProfileInject.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/MDBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Format.h"
#include "llvm/Support/Path.h"

#define DEBUG_TYPE "hydra-profile-inject"

STATISTIC(NumFunctionsProcessed, "Number of functions processed");
STATISTIC(NumFunctionsModified, "Number of functions with branch weights injected");

using namespace llvm;

namespace hydra {

// ---------------------------------------------------------------------------
// HydraProfileLoader
// ---------------------------------------------------------------------------

FunctionProfile *HydraProfileLoader::load(const std::string &FuncName) {
  SmallString<256> FilePath(ProfileDirectory);
  sys::path::append(FilePath, FuncName + ".prof.full.edges");

  if (!sys::fs::exists(FilePath)) {
    LLVM_DEBUG(dbgs() << "no profile for " << FuncName << "\n");
    return nullptr;
  }

  FunctionProfile FP;
  if (!ProfileParser::parseEdgeFile(std::string(FilePath), FP)) {
    LLVM_DEBUG(dbgs() << "failed to parse " << FilePath << "\n");
    return nullptr;
  }

  ++Misses;
  Cache[FuncName] = std::move(FP);
  return &Cache[FuncName];
}

FunctionProfile *HydraProfileLoader::get(const std::string &FuncName) {
  auto It = Cache.find(FuncName);
  if (It != Cache.end()) {
    ++Hits;
    return &It->second;
  }
  return load(FuncName);
}

void HydraProfileLoader::printStats(raw_ostream &OS) const {
  OS << "profile cache: " << Cache.size() << " entries, "
     << Hits << " hits, " << Misses << " misses";
  if (Hits + Misses > 0)
    OS << format(" (%.1f%% hit rate)", 100.0 * Hits / (Hits + Misses));
  OS << "\n";
}

// ---------------------------------------------------------------------------
// HydraProfileInjectPass helpers
// ---------------------------------------------------------------------------

static StringMap<uint64_t>
buildEdgeMap(const std::vector<ProfileEdge> &Edges) {
  StringMap<uint64_t> Map;
  for (const auto &E : Edges) {
    SmallString<128> Key(E.SourceBB);
    Key += "->";
    Key += E.DestBB;
    Map[Key] = E.Count;
  }
  return Map;
}

// Named blocks keep their LLVM name; unnamed blocks get a positional index.
// This matches what instnamer assigns and what profdata2Edges writes.
static DenseMap<const BasicBlock *, std::string>
buildBBIds(const Function &F) {
  DenseMap<const BasicBlock *, std::string> Ids;
  Ids.reserve(F.size());
  size_t Idx = 0;
  for (const BasicBlock &BB : F) {
    Ids[&BB] = BB.hasName() ? BB.getName().str() : std::to_string(Idx);
    ++Idx;
  }
  return Ids;
}

// Look up the edge count; return 0 if not in the profile.
static uint64_t edgeCount(const StringMap<uint64_t> &EdgeMap,
                           const std::string &Src, const std::string &Dst) {
  SmallString<128> Key(Src);
  Key += "->";
  Key += Dst;
  auto It = EdgeMap.find(Key);
  return It != EdgeMap.end() ? It->second : 0;
}

// NOTE: We are restricting values to a safe range, so we prefer "rarely taken" 
// over "never taken" when we simply have no observation rather than a confirmed zero.
static uint64_t clampWeight(uint64_t W) { return W == 0 ? 1 : W; }

static bool handleBranchInst(BranchInst &BI,
                              const StringMap<uint64_t> &EdgeMap,
                              const DenseMap<const BasicBlock *, std::string> &BBIds) {

  if (!BI.isConditional())
    return false;

  const std::string &Src  = BBIds.lookup(BI.getParent());
  uint64_t TrueW  = edgeCount(EdgeMap, Src, BBIds.lookup(BI.getSuccessor(0)));
  uint64_t FalseW = edgeCount(EdgeMap, Src, BBIds.lookup(BI.getSuccessor(1)));

  if (TrueW == 0 && FalseW == 0)
    return false;

  MDBuilder MDB(BI.getContext());
  BI.setMetadata(LLVMContext::MD_prof,
                 MDB.createBranchWeights(clampWeight(TrueW),
                                         clampWeight(FalseW)));

  LLVM_DEBUG(dbgs() << "  branch " << Src
                    << ": true=" << TrueW << " false=" << FalseW << "\n");
  return true;
}

static bool handleSwitchInst(SwitchInst &SI,
                              const StringMap<uint64_t> &EdgeMap,
                              const DenseMap<const BasicBlock *, std::string> &BBIds) {

  const std::string &Src = BBIds.lookup(SI.getParent());
  unsigned NumSucc = SI.getNumSuccessors();

  SmallVector<uint32_t, 8> Weights(NumSucc, 0);
  bool AnyNonZero = false;

  for (unsigned I = 0; I < NumSucc; ++I) {
    uint64_t W = edgeCount(EdgeMap, Src, BBIds.lookup(SI.getSuccessor(I)));
    if (W > 0) {
      // Saturate to uint32_t since MDBuilder weights are 32-bit.
      // TODO: Elisa if you find a better strategy you can change.
      Weights[I] = static_cast<uint32_t>(
          std::min(W, (uint64_t)std::numeric_limits<uint32_t>::max()));
      AnyNonZero = true;
    }
  }

  if (!AnyNonZero)
    return false;

  for (auto &W : Weights)
    W = clampWeight(W);

  MDBuilder MDB(SI.getContext());
  SI.setMetadata(LLVMContext::MD_prof, MDB.createBranchWeights(Weights));

  LLVM_DEBUG({
    dbgs() << "  switch " << Src << ":";
    for (unsigned I = 0; I < NumSucc; ++I)
      dbgs() << " " << BBIds.lookup(SI.getSuccessor(I)) << "=" << Weights[I];
    dbgs() << "\n";
  });
  return true;
}

bool HydraProfileInjectPass::injectWeights(Function &F,
                                            const std::vector<ProfileEdge> &Edges) {
  auto EdgeMap = buildEdgeMap(Edges);
  auto BBIds   = buildBBIds(F);
  bool Modified = false;

  for (BasicBlock &BB : F) {
    auto *Term = BB.getTerminator();
    if (!Term)
      continue;
    if (auto *BI = dyn_cast<BranchInst>(Term))
      Modified |= handleBranchInst(*BI, EdgeMap, BBIds);
    else if (auto *SI = dyn_cast<SwitchInst>(Term))
      Modified |= handleSwitchInst(*SI, EdgeMap, BBIds);
  }

  return Modified;
}

// ---------------------------------------------------------------------------
// Pass entry point
// ---------------------------------------------------------------------------

HydraProfileInjectPass::HydraProfileInjectPass(std::string Dir) {
  Loader.setProfileDirectory(std::move(Dir));
}

PreservedAnalyses HydraProfileInjectPass::run(Module &M,
                                               ModuleAnalysisManager &) {
  for (Function &F : M) {
    if (F.isDeclaration())
      continue;

    ++NumFunctionsProcessed;

    auto *Profile = Loader.get(F.getName().str());
    if (!Profile)
      continue;

    if (Profile->EntryCount)
      F.setEntryCount(*Profile->EntryCount);

    if (injectWeights(F, Profile->Edges))
      ++NumFunctionsModified;
  }

  LLVM_DEBUG(Loader.printStats(dbgs()));

  return NumFunctionsModified > 0 ? PreservedAnalyses::none()
                                  : PreservedAnalyses::all();
}

} // namespace hydra

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "HydraProfileInject", LLVM_VERSION_STRING,
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name, ModulePassManager &MPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name.consume_front("hydra-inject=")) {
            MPM.addPass(hydra::HydraProfileInjectPass(Name.str()));
            return true;
          }
          return false;
        }
      );
    }
  };
}
