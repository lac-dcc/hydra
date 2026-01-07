#include "HistRegion.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Transforms/Utils/BreakCriticalEdges.h"
#include <iostream>

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "block-ordering-hist-region") {
        // FPM.addPass(LoopSimplifyPass());
        // FPM.addPass(BreakCriticalEdgesPass());
        FPM.addPass(HistRegionPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getHistRegion() {
    return {
        LLVM_PLUGIN_API_VERSION, "block-ordering-hist-region",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getHistRegion();
}