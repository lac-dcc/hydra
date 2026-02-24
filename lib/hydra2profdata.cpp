//===- hydra2profdata.cpp - Convert Hydra Profiles to .profdata ----------===//
//
// Command-line tool to convert Hydra runtime edge profiles to LLVM .profdata
//
// Usage: hydra2profdata <input.ll> <profile_dir> [output.profdata]
//
//===----------------------------------------------------------------------===//

#include "HydraProfileConverter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

static cl::opt<std::string> InputFilename(cl::Positional, cl::Required,
    cl::desc("<input.ll>"),
    cl::value_desc("instrumented LLVM IR file"));

static cl::opt<std::string> ProfileDir(cl::Positional, cl::Required,
    cl::desc("<profile_dir>"),
    cl::value_desc("directory containing .prof.full.edges files"));

static cl::opt<std::string> OutputFilename(cl::Positional,
    cl::desc("[output.profdata]"),
    cl::init("output.profdata"),
    cl::value_desc("output .profdata file"));

int main(int argc, char **argv) {
  InitLLVM X(argc, argv);
  cl::ParseCommandLineOptions(argc, argv,
      "Convert Hydra edge profiles to LLVM .profdata\n");

  // TODO: Elisa can you please test this part to make sure we are handling it
  // gracefully in all cases?
  if (!sys::fs::is_directory(ProfileDir)) {
    errs() << "Error: profile directory does not exist or is not a directory: "
           << ProfileDir << "\n";
    return 1;
  }

  LLVMContext Context;
  SMDiagnostic Err;
  std::unique_ptr<Module> M = parseIRFile(InputFilename, Err, Context);
  if (!M) {
    Err.print(argv[0], errs());
    return 1;
  }

  hydra::HydraProfileConverter Converter(*M, ProfileDir);
  if (!Converter.convertAndWrite(OutputFilename)) {
    errs() << "Error: Profile conversion failed\n";
    return 1;
  }

  return 0;
}
