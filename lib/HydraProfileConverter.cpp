//===- HydraProfileConverter.cpp - Convert .prof.full.edges to .profdata -===//
//
// Implements HydraProfileConverter: reads per-function .prof.full.edges files
// and writes a single LLVM .profdata that the standard PGO pipeline accepts.
//
//===----------------------------------------------------------------------===//

#include "HydraProfileConverter.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/ProfileData/InstrProf.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Format.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "hydra-profile-converter"

using namespace llvm;

namespace hydra {

// ---------------------------------------------------------------------------
// Block-frequency helpers
// ---------------------------------------------------------------------------

// Sum incoming edge counts for each basic block.
// Entry blocks that appear only as sources get their outgoing sum as a
// fallback so they are never missing from the map.
static StringMap<uint64_t>
edgesToBlockFreqs(const std::vector<ProfileEdge> &Edges) {
  StringMap<uint64_t> Incoming, Outgoing;
  for (const auto &E : Edges) {
    Incoming[E.DestBB]   += E.Count;
    Outgoing[E.SourceBB] += E.Count;
  }

  StringMap<uint64_t> BlockFreqs;
  for (const auto &[Name, Sum] : Incoming)
    BlockFreqs[Name] = Sum;
  for (const auto &[Name, Sum] : Outgoing)
    BlockFreqs.try_emplace(Name, Sum);

  LLVM_DEBUG({
    for (const auto &[BB, Freq] : BlockFreqs)
      dbgs() << "  block " << BB << ": " << Freq << "\n";
  });
  return BlockFreqs;
}

// ---------------------------------------------------------------------------
// Hash helpers
// ---------------------------------------------------------------------------

// Try to read the coverage hash from the __covrec_ global. This hash is more
// stable than the PGO name hash when the function has been renamed by inlining.
// TODO: Elisa can you please explore other matching ideas?
static std::optional<uint64_t> coverageHash(const Module &M,
                                              const Function &F) {
  std::string FuncName = getPGOFuncName(F);
  uint64_t NameHash = IndexedInstrProf::ComputeHash(FuncName);

  SmallString<64> RecName;
  raw_svector_ostream OS(RecName);
  OS << "__covrec_" << format_hex_no_prefix(NameHash, 16, /*Upper=*/true) << "u";

  const GlobalVariable *Rec = M.getNamedGlobal(OS.str());
  if (!Rec)
    return std::nullopt;

  const auto *CS = dyn_cast_or_null<ConstantStruct>(Rec->getInitializer());
  if (!CS || CS->getNumOperands() < 3)
    return std::nullopt;

  const auto *HashVal = dyn_cast<ConstantInt>(CS->getOperand(2));
  return HashVal ? std::optional<uint64_t>(HashVal->getZExtValue()) : std::nullopt;
}

uint64_t HydraProfileConverter::getFunctionHash(const Function &F) {
  if (auto H = coverageHash(Mod, F))
    return *H;
  return IndexedInstrProf::ComputeHash(getPGOFuncName(F));
}

// ---------------------------------------------------------------------------
// Counter mapping
// ---------------------------------------------------------------------------

std::optional<unsigned>
HydraProfileConverter::getInstrCounterCount(const Function &F) {
  std::string ProfdName = "__profd_" + getPGOFuncName(F);
  const GlobalVariable *Profd = Mod.getNamedGlobal(ProfdName);
  if (!Profd)
    return std::nullopt;

  const auto *CS = dyn_cast_or_null<ConstantStruct>(Profd->getInitializer());
  // Field 6 is NumCounters in LLVM 20 and we need to validate size and type before touching it.
  if (!CS || CS->getNumOperands() <= 6)
    return std::nullopt;

  const auto *N = dyn_cast<ConstantInt>(CS->getOperand(6));
  return N ? std::optional<unsigned>(N->getZExtValue()) : std::nullopt;
}

bool HydraProfileConverter::blockFreqsToCounters(
    const Function &F, const StringMap<uint64_t> &BlockFreqs,
    std::vector<uint64_t> &Counts) {

  auto NumCounters = getInstrCounterCount(F);
  if (!NumCounters) {
    errs() << "warning: " << F.getName()
           << ": no __profd_ metadata; skipping (needs -fprofile-instr-generate)\n";
    return false;
  }

  Counts.clear();
  Counts.reserve(*NumCounters);

  // NOTE: This is an approximation! We assign block frequencies in iteration order up to
  // NumCounters slots. The real counter layout follows a spanning tree and
  // may not match, but this is good enough for most straight-line hot paths.
  // Missing blocks get 1 rather than 0 to avoid "never executed" misclassification.
  // TODO: Elisa please implement the spanning tree matching for an exact match.
  for (const BasicBlock &BB : F) {
    if (Counts.size() >= *NumCounters)
      break;
    auto It = BlockFreqs.find(BB.getName());
    Counts.push_back(It != BlockFreqs.end() ? std::max(It->second, uint64_t(1))
                                            : 1);
  }
  while (Counts.size() < *NumCounters)
    Counts.push_back(1);

  LLVM_DEBUG({
    for (unsigned I = 0; I < Counts.size(); ++I)
      dbgs() << "  counter[" << I << "] = " << Counts[I] << "\n";
  });
  return true;
}

// ---------------------------------------------------------------------------
// Per-function processing
// ---------------------------------------------------------------------------

bool HydraProfileConverter::processFunctionProfile(Function &F,
                                                    InstrProfWriter &Writer) {
  if (F.isDeclaration())
    return true;

  SmallString<256> ProfilePath(ProfileDirectory);
  sys::path::append(ProfilePath, getPGOFuncName(F) + ".prof.full.edges");

  if (!sys::fs::exists(ProfilePath))
    return true; // no profile is fine; just skip the function

  FunctionProfile FP;
  // TODO: Elisa I tried to mimic your style for Nisse here, you can change if needed.
  // Explore better options if needed.
  if (!ProfileParser::parseEdgeFile(std::string(ProfilePath), FP)) {
    errs() << "warning: failed to parse profile for " << F.getName() << "\n";
    return false;
  }

  auto BlockFreqs = edgesToBlockFreqs(FP.Edges);

  std::vector<uint64_t> Counts;
  if (!blockFreqsToCounters(F, BlockFreqs, Counts))
    return false;

  NamedInstrProfRecord Record(getIRPGOFuncName(F), getFunctionHash(F), Counts);
  Writer.addRecord(std::move(Record), 1, [&](Error Err) {
    errs() << "warning: profile record for " << F.getName()
           << ": " << toString(std::move(Err)) << "\n";
  });

  LLVM_DEBUG(dbgs() << F.getName() << ": " << Counts.size() << " counters\n");
  return true;
}

// ---------------------------------------------------------------------------
// Top-level
// ---------------------------------------------------------------------------

bool HydraProfileConverter::convertAndWrite(const std::string &OutputPath) {
  InstrProfWriter Writer;
  unsigned OK = 0, Failed = 0;

  for (Function &F : Mod) {
    if (processFunctionProfile(F, Writer))
      ++OK;
    else
      ++Failed;
  }

  if (OK == 0) {
    errs() << "error: no functions converted\n";
    return false;
  }

  std::error_code EC;
  raw_fd_ostream Out(OutputPath, EC, sys::fs::OF_None);
  if (EC) {
    errs() << "error: cannot open '" << OutputPath << "': " << EC.message() << "\n";
    return false;
  }

  if (auto Err = Writer.write(Out)) {
    errs() << "error: " << toString(std::move(Err)) << "\n";
    return false;
  }

  outs() << "wrote " << OutputPath
         << "  (" << OK << " functions";
  if (Failed)
    outs() << ", " << Failed << " failed";
  outs() << ")\n";
  return true;
}

} // namespace hydra
