#include "Predictor.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Transforms/Utils/BreakCriticalEdges.h"

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "block-ordering-predictor") {
        // FPM.addPass(LoopSimplifyPass());
        // FPM.addPass(BreakCriticalEdgesPass());
        FPM.addPass(PredictorPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getPredictor() {
    return {
        LLVM_PLUGIN_API_VERSION, "block-ordering-predictor",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getPredictor();
}