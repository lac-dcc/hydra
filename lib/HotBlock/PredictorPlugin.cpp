#include "Predictor.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

bool registerPipeline(StringRef Name, FunctionPassManager &FPM,
                      ArrayRef<PassBuilder::PipelineElement>) {
    if (Name == "hotblock-predictor") {
        FPM.addPass(PredictorPass());
        return true;
    }
    return false;
}

PassPluginLibraryInfo getPredictor() {
    return {
        LLVM_PLUGIN_API_VERSION, "hotblock-predictor",
        LLVM_VERSION_STRING, [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(registerPipeline);
        }
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getPredictor();
}