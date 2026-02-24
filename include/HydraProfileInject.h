//===- HydraProfileInject.h - Inject projected profiles into LLVM IR -----===//
//
// Opt pass that reads Hydra .prof.full.edges files and attaches branch_weights
// metadata and function entry counts to the IR so the O3 optimizer can use
// them.
//
//===----------------------------------------------------------------------===//

#ifndef HYDRA_PROFILE_INJECT_H
#define HYDRA_PROFILE_INJECT_H

#include "HydraProfile.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"

namespace hydra {

class HydraProfileLoader {
  llvm::StringMap<FunctionProfile> Cache;
  std::string ProfileDirectory;
  size_t Hits = 0;
  size_t Misses = 0;

  FunctionProfile *load(const std::string &FuncName);

public:
  void setProfileDirectory(const std::string &Dir) { ProfileDirectory = Dir; }
  FunctionProfile *get(const std::string &FuncName);
  void printStats(llvm::raw_ostream &OS) const;
};

class HydraProfileInjectPass
    : public llvm::PassInfoMixin<HydraProfileInjectPass> {
  HydraProfileLoader Loader;

  // Helpers are private and defined in the .cpp to keep IR types out of
  // the header.
  bool injectWeights(llvm::Function &F,
                     const std::vector<ProfileEdge> &Edges);

public:
  explicit HydraProfileInjectPass(std::string Dir);

  llvm::PreservedAnalyses run(llvm::Module &M,
                               llvm::ModuleAnalysisManager &MAM);

  static bool isRequired() { return true; }
};

} // namespace hydra

#endif // HYDRA_PROFILE_INJECT_H
