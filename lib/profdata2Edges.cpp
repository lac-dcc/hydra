//===- profdata2Edges.cpp - Extract Hydra edge profiles from annotated IR -===//
//
// Reads an LLVM IR file annotated by pgo-instr-use (branches have
// !prof branch_weights metadata) and writes one .prof.full.edges file
// per function in Hydra's edge-profile format:
//
//   entry: count
//   srcBB -> dstBB : count
//
// The "entry:" line records how many times the function was called.
// The optimizer uses this for inlining decisions and loop unrolling.
//
// Usage:
//   profdata2Edges  <annotated.ll>  <output_dir>
//
//===----------------------------------------------------------------------===//

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

static cl::opt<std::string> InputFile(cl::Positional, cl::Required,
    cl::desc("<annotated.ll>"));

static cl::opt<std::string> OutputDir(cl::Positional, cl::Required,
    cl::desc("<output_dir>"));

static std::string bbName(const BasicBlock &BB) {
  if (BB.hasName())
    return BB.getName().str();
  const Function *F = BB.getParent();
  return std::to_string(std::distance(F->begin(), BB.getIterator()));
}

static SmallVector<uint64_t, 4> getBranchWeights(const Instruction &Term) {
  MDNode *Prof = Term.getMetadata(LLVMContext::MD_prof);
  if (!Prof || Prof->getNumOperands() < 2)
    return {};

  auto *Tag = dyn_cast<MDString>(Prof->getOperand(0));
  if (!Tag || Tag->getString() != "branch_weights")
    return {};

  SmallVector<uint64_t, 4> Weights;
  for (unsigned I = 1; I < Prof->getNumOperands(); ++I) {
    auto *CI = mdconst::dyn_extract<ConstantInt>(Prof->getOperand(I));
    Weights.push_back(CI ? CI->getZExtValue() : 0);
  }
  return Weights;
}

static bool writeFunctionEdges(const Function &F, StringRef Dir) {
  SmallString<256> FilePath(Dir);
  sys::path::append(FilePath, F.getName() + ".prof.full.edges");

  std::error_code EC;
  raw_fd_ostream OS(FilePath, EC, sys::fs::OF_Text);
  if (EC) {
    errs() << "Error: cannot open " << FilePath << ": " << EC.message() << "\n";
    return false;
  }

  // Emit function entry count if the profile recorded one.
  if (auto EntryCount = F.getEntryCount())
    OS << "entry: " << EntryCount->getCount() << "\n";

  bool HasAnyEdge = false;

  for (const BasicBlock &BB : F) {
    const Instruction *Term = BB.getTerminator();
    if (!Term)
      continue;

    std::string Src = bbName(BB);
    SmallVector<uint64_t, 4> Weights = getBranchWeights(*Term);

    if (const auto *BI = dyn_cast<BranchInst>(Term)) {
      if (BI->isConditional()) {
        // weights[0] = true successor, weights[1] = false successor
        for (unsigned I = 0; I < BI->getNumSuccessors(); ++I) {
          uint64_t W = (I < Weights.size()) ? Weights[I] : 0;
          OS << Src << " -> " << bbName(*BI->getSuccessor(I)) << " : " << W << "\n";
          HasAnyEdge = true;
        }
      } else {
        // Unconditional: count 0; flow inference propagates from surrounding edges.
        OS << Src << " -> " << bbName(*BI->getSuccessor(0)) << " : 0\n";
        HasAnyEdge = true;
      }
    } else if (const auto *SI = dyn_cast<SwitchInst>(Term)) {
      for (unsigned I = 0; I < SI->getNumSuccessors(); ++I) {
        uint64_t W = (I < Weights.size()) ? Weights[I] : 0;
        OS << Src << " -> " << bbName(*SI->getSuccessor(I)) << " : " << W << "\n";
        HasAnyEdge = true;
      }
    }
  }

  return HasAnyEdge;
}

int main(int argc, char **argv) {
  InitLLVM X(argc, argv);
  cl::ParseCommandLineOptions(argc, argv,
      "Extract Hydra .prof.full.edges files from a PGO-annotated LLVM IR\n");

  if (std::error_code EC = sys::fs::create_directories(OutputDir)) {
    errs() << "Error: cannot create output directory '" << OutputDir
           << "': " << EC.message() << "\n";
    return 1;
  }

  LLVMContext Ctx;
  SMDiagnostic Err;
  std::unique_ptr<Module> M = parseIRFile(InputFile, Err, Ctx);
  if (!M) {
    Err.print(argv[0], errs());
    return 1;
  }

  unsigned Written = 0, Skipped = 0;
  for (const Function &F : *M) {
    if (F.isDeclaration())
      continue;
    if (writeFunctionEdges(F, OutputDir))
      ++Written;
    else
      ++Skipped;
  }

  outs() << "  Wrote " << Written << " edge profile files to " << OutputDir << "\n";
  if (Skipped)
    outs() << "  Skipped " << Skipped << " functions (no edges)\n";
  return 0;
}
