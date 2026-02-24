//===- HydraProfile.h - Shared profile types and edge-file parser ---------===//
//
// Defines the edge-profile data structures and the .prof.full.edges parser
// used by both the inject pass and the profdata converter tool.
//
// File format (.prof.full.edges):
//   entry: count        <- this is optional and records call count
//   srcBB -> dstBB : count
//
//===----------------------------------------------------------------------===//

#ifndef HYDRA_PROFILE_H
#define HYDRA_PROFILE_H

#include "llvm/Support/LineIterator.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/raw_ostream.h"
#include <optional>
#include <string>
#include <vector>

namespace hydra {

struct ProfileEdge {
  std::string SourceBB;
  std::string DestBB;
  uint64_t Count;

  ProfileEdge(std::string Src, std::string Dst, uint64_t C)
      : SourceBB(std::move(Src)), DestBB(std::move(Dst)), Count(C) {}
};

struct FunctionProfile {
  std::vector<ProfileEdge> Edges;
  std::optional<uint64_t> EntryCount;
};

namespace ProfileParser {

// Parses a .prof.full.edges file into a FunctionProfile.
// Returns false if the file cannot be opened or contains no edges.
inline bool parseEdgeFile(const std::string &FilePath,
                          FunctionProfile &Profile) {
  auto MBOrErr = llvm::MemoryBuffer::getFile(FilePath);
  if (!MBOrErr) {
    llvm::errs() << "cannot open profile: " << FilePath << "\n";
    return false;
  }

  for (llvm::line_iterator It(**MBOrErr, /*SkipBlanks=*/true, '#');
       !It.is_at_eof(); ++It) {
    llvm::StringRef Line = *It;

    if (Line.starts_with("entry:")) {
      uint64_t N;
      if (!Line.drop_front(6).trim().getAsInteger(10, N))
        Profile.EntryCount = N;
      continue;
    }

    auto [BeforeArrow, AfterArrow] = Line.split("->");
    if (AfterArrow.empty())
      continue;

    auto [DestPart, CountStr] = AfterArrow.split(':');
    if (CountStr.empty())
      continue;

    uint64_t Count;
    if (CountStr.trim().getAsInteger(10, Count))
      continue;

    Profile.Edges.emplace_back(BeforeArrow.trim().str(),
                                DestPart.trim().str(), Count);
  }

  return !Profile.Edges.empty();
}

} // namespace ProfileParser

} // namespace hydra

#endif // HYDRA_PROFILE_H
