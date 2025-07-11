#include "Nested.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Transforms/Utils/BreakCriticalEdges.h"

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "hotblock-nested") {
        FPM.addPass(LoopSimplifyPass());
        FPM.addPass(BreakCriticalEdgesPass());
        FPM.addPass(NestedPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getNested() {
    return {
        LLVM_PLUGIN_API_VERSION, "hotblock-nested",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getNested();
}