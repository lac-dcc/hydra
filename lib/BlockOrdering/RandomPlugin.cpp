#include "Random.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Transforms/Utils/BreakCriticalEdges.h"

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "block-ordering-random") {
        FPM.addPass(LoopSimplifyPass());
        FPM.addPass(BreakCriticalEdgesPass());
        FPM.addPass(RandomPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getBOPRandom() {
    return {
        LLVM_PLUGIN_API_VERSION, "block-ordering-random",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getBOPRandom();
}