//===- HydraProfileConverter.h - Convert .prof.full.edges to .profdata ---===//
//
// Reads a directory of Hydra edge-profile files and writes a single LLVM
// .profdata file that can be fed back into the standard PGO pipeline.
//
//===----------------------------------------------------------------------===//

#ifndef HYDRA_PROFILE_CONVERTER_H
#define HYDRA_PROFILE_CONVERTER_H

#include "HydraProfile.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IR/Module.h"
#include "llvm/ProfileData/InstrProfWriter.h"
#include <optional>
#include <string>

namespace hydra {

class HydraProfileConverter {
public:
  HydraProfileConverter(llvm::Module &M, const std::string &ProfileDir)
      : Mod(M), ProfileDirectory(ProfileDir) {}

  bool convertAndWrite(const std::string &OutputPath);

private:
  llvm::Module &Mod;
  std::string ProfileDirectory;

  bool processFunctionProfile(llvm::Function &F, llvm::InstrProfWriter &Writer);

  uint64_t getFunctionHash(const llvm::Function &F);

  // Returns the counter count from the __profd_ global written by pgo-instr-gen.
  // Field 6 is NumCounters in LLVM's instrumentation ABI, this may change across
  // LLVM versions, we are currently using LLVM 20. Returns nullopt if the global 
  // or field is missing.
  std::optional<unsigned> getInstrCounterCount(const llvm::Function &F);

  // Maps block frequencies to the counter array slots.
  // LLVM's pgo-instr-gen uses a spanning tree and counters correspond to
  // non-tree edges, not blocks. This assigns frequencies by block iteration
  // order, which is an approximation.
  // TODO: Elisa for an exact assiignment you will need to reconstruct the spanning-tree
  // mapping here we have a loose implementation that needs improvement.
  bool blockFreqsToCounters(const llvm::Function &F,
                             const llvm::StringMap<uint64_t> &BlockFreqs,
                             std::vector<uint64_t> &Counts);
};

} // namespace hydra

#endif // HYDRA_PROFILE_CONVERTER_H
