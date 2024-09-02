#include "HBPRandom.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Transforms/Utils/BreakCriticalEdges.h"

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "hotblock-random") {
        FPM.addPass(LoopSimplifyPass());
        FPM.addPass(BreakCriticalEdgesPass());
        FPM.addPass(HBPRandomPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getHBPRandom() {
    return {
        LLVM_PLUGIN_API_VERSION, "hotblock-random",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getHBPRandom();
}