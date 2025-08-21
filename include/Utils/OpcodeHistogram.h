#ifndef BOP_OPCODE_HISTOGRAM_H
#define BOP_OPCODE_HISTOGRAM_H

#include <vector>
#include <map>
#include <set>
#include <fstream>
#include "llvm/IR/BasicBlock.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

/// An object wrapping two vectors, where one represents the opcodes and the
/// other the frequency of every opcode.
struct OpcodeHistogram {
private:
  std::vector<uint32_t> Opcodes, Frequency;
  bool Matched;
public:
  explicit OpcodeHistogram() {}

  explicit OpcodeHistogram(const std::vector<uint32_t> &_Opcodes,
                            const std::vector<uint32_t> &_Frequency) {
    assert(Opcodes.size() == Frequency.size() &&
            "Opcode Histogram size mismatch");
    Opcodes.assign(_Opcodes.begin(), _Opcodes.end());
    Frequency.assign(_Frequency.begin(), _Frequency.end());
    Matched = false;
  }

  std::pair<size_t, size_t> getHistogramSize() {
    return {Opcodes.size(), Frequency.size()};
  }

  bool isMatched() {
    return Matched;
  }

  void Match() {
    Matched = true;
  }

  const void operator+=(const OpcodeHistogram &OH) {
    std::map<uint32_t, uint64_t> Frequencies;
    std::map<uint32_t, bool> UsedFrequencies;
    for (size_t I = 0; I < OH.Opcodes.size(); I++) {
      Frequencies[OH.Opcodes[I]] = OH.Frequency[I];
      UsedFrequencies[OH.Opcodes[I]] = 0;
    }
    
    for (size_t I = 0; I < Opcodes.size(); I++) {
      Frequency[I] += Frequencies[Opcodes[I]];
      UsedFrequencies[Opcodes[I]] = 1;
    }

    for (const auto [Opcode, Freq] : Frequencies) {
      if (!UsedFrequencies[Opcode]) {
        Opcodes.emplace_back(Opcode);
        Frequency.emplace_back(Freq);
      }
    }
  }

  uint64_t distance2(const OpcodeHistogram *OH) const {
    std::map<uint32_t, int64_t> Frequencies;
    for (size_t I = 0; I < Opcodes.size(); I++) {
      Frequencies[Opcodes[I]] = Frequency[I];
    }
    
    
    for (size_t I = 0; I < OH->Opcodes.size(); I++) {
      if (Frequencies.count(OH->Opcodes[I]) > 0) {
        Frequencies[OH->Opcodes[I]] -= (int64_t)OH->Frequency[I];
      } else {
        Frequencies[OH->Opcodes[I]] = OH->Frequency[I];
      }
    }

    int64_t Distance2 = 0;
    
    for (const auto [Opcode, Freq] : Frequencies) {
      Distance2 += (Freq*Freq);
    }
    
    return (uint64_t)Distance2;
  }

  friend raw_ostream &operator<<(raw_ostream &os, const OpcodeHistogram &OH) {
    for (int I = 0; I < OH.Opcodes.size(); ++I) {
      os << OH.Opcodes[I] << ": " << OH.Frequency[I] << "\n";
    }
    return os;
  }
};

#endif // BOP_OPCODE_HISTOGRAM_H