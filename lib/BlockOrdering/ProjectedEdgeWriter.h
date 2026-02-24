#ifndef HYDRA_PROJECTED_EDGE_WRITER_H
#define HYDRA_PROJECTED_EDGE_WRITER_H

#include "llvm/ADT/SmallString.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/raw_ostream.h"
#include "../Utils/WeightedProfileInference.h"
#include <vector>

namespace llvm {

// Write the inferred edge counts from a FlowFunction to a .prof.full.edges
// file under OutDir, named after the function. BlockOrder maps FlowBlock
// indices (1-based) to their corresponding BasicBlocks in the new IR.
inline void writeProjectedEdges(const FlowFunction &Func,
                                 const std::vector<BasicBlock *> &BlockOrder,
                                 StringRef FuncName,
                                 StringRef OutDir) {
  SmallString<256> Path(OutDir);
  sys::path::append(Path, FuncName + ".prof.full.edges");

  std::error_code EC;
  raw_fd_ostream OS(Path, EC, sys::fs::OF_Text);
  if (EC)
    return;

  for (const FlowBlock &Block : Func.Blocks) {
    if (Block.Index == 0)
      continue;
    StringRef Src = BlockOrder[Block.Index - 1]->getName();
    for (const FlowJump *Jump : Block.SuccJumps) {
      if (Jump->Target == 0)
        continue;
      StringRef Dst = BlockOrder[Jump->Target - 1]->getName();
      OS << Src << " -> " << Dst << " : " << Jump->Weight << "\n";
    }
  }
}

} // namespace llvm

#endif // HYDRA_PROJECTED_EDGE_WRITER_H
