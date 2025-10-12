#include "Ayupov.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Transforms/Utils/BreakCriticalEdges.h"
#include <iostream>

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "block-ordering-ayupov") {
        // FPM.addPass(LoopSimplifyPass());
        // FPM.addPass(BreakCriticalEdgesPass());
        FPM.addPass(AyupovPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getAyupov() {
    return {
        LLVM_PLUGIN_API_VERSION, "block-ordering-ayupov",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getAyupov();
}