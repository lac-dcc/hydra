#!/bin/bash
#
# cBench PGO comparison: six pipelines.
#
#  o0             : clang -O0 per-TU (unoptimized reference)
#  baseline       : clang -O3 per-TU (no profile, no LTO)
#  traditional    : clang -O3 per-TU with real O3 PGO profile
#  wm_baseline    : whole-module O3, no profile  (isolates LTO effect)
#  wm_traditional : whole-module O3 with real O3 PGO profile (oracle ceiling)
#  projected      : whole-module O3 with O0->O3 projected profile (Hydra)
#
# Comparison pairs that matter:
#   projected vs baseline        -> total benefit of Hydra
#   projected vs wm_baseline     -> profile contribution only (removes LTO effect)
#   projected vs wm_traditional  -> Hydra accuracy vs oracle PGO
#

set -e

HYDRA_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLVM="${LLVM_BIN:-/usr/lib/llvm-20/bin}"
CBENCH_DIR="${CBENCH_DIR:-$HYDRA_ROOT/Benchmark/cBench}"
RESULTS_DIR="${RESULTS_DIR:-$HYDRA_ROOT/cbench_pgo_results}"
HYDRA_INJECT="$HYDRA_ROOT/build/lib/libHydraProfileInject.so"
HASH_MATCHING="$HYDRA_ROOT/build/lib/libBlockOrderingHashMatching.so"
PROFDATA_TO_EDGES="$HYDRA_ROOT/build/bin/profdata2Edges"

BENCHMARKS=(
    "automotive_bitcount"
    # "automotive_qsort1"
    # "automotive_susan_c"
    # "automotive_susan_e"
    # "automotive_susan_s"
    # "bzip2d"
    # "bzip2e"
    # "consumer_jpeg_c"
    # "consumer_jpeg_d"
    # "consumer_lame"
    # "consumer_mad"
    # "consumer_tiff2bw"
    # "consumer_tiff2rgba"
    # "consumer_tiffdither"
    # "consumer_tiffmedian"
    "network_dijkstra"
    "network_patricia"
    # "office_ghostscript"
    # "office_ispell"
    # "office_rsynth"
    # "office_stringsearch1"
    # "security_blowfish_d"
    # "security_blowfish_e"
    # "security_pgp_d"
    # "security_pgp_e"
    # "security_rijndael_d"
    # "security_rijndael_e"
    # "security_sha"
    # "telecom_CRC32"
    # "telecom_adpcm_c"
    # "telecom_adpcm_d"
    # "telecom_gsm"
)

NUM_RUNS=3

# ---------------------------------------------------------------------------
# run_bench <exe>
#    run exe NUM_RUNS times and print the average elapsed time.
# ---------------------------------------------------------------------------
run_bench() {
    local exe=$1 total=0
    for ((i=1; i<=NUM_RUNS; i++)); do
        local start end elapsed
        start=$(date +%s.%N)
        "$BENCH_DIR/src_work/__run" "$BENCH_DIR/src_work" 1 "$exe" \
            > /dev/null 2>&1 || true
        end=$(date +%s.%N)
        elapsed=$(echo "$end - $start" | bc)
        total=$(echo "$total + $elapsed" | bc)
    done
    echo "scale=4; $total / $NUM_RUNS" | bc
}

# ---------------------------------------------------------------------------
# build_o3_module <proj_work>
#   Compile each source TU at O3 to BC, link into one module, normalize.
#   Writes proj_work/o3.ll on success.  Returns 1 on any failure.
# ---------------------------------------------------------------------------
build_o3_module() {
    local proj_work=$1
    local bc_parts=()

    for src_f in "$BENCH_DIR/src_work/"*.c; do
        [ -f "$src_f" ] || continue
        local bc="$proj_work/$(basename "${src_f%.c}")_o3.bc"
        $LLVM/clang -O3 -emit-llvm -c "$src_f" -o "$bc" 2>/dev/null \
            || { echo "  [wm] O3 IR generation failed"; return 1; }
        bc_parts+=("$bc")
    done

    [ ${#bc_parts[@]} -gt 0 ] || { echo "  [wm] no source files"; return 1; }

    $LLVM/llvm-link "${bc_parts[@]}" -o "$proj_work/merged_o3.bc" 2>/dev/null \
        || { echo "  [wm] llvm-link failed"; return 1; }
    $LLVM/opt -S -passes="mem2reg,instnamer,loop-simplify,break-crit-edges" \
        "$proj_work/merged_o3.bc" -o "$proj_work/o3.ll" 2>/dev/null \
        || { echo "  [wm] normalization failed"; return 1; }

    rm -f "${bc_parts[@]}"
}

# ---------------------------------------------------------------------------
# run_wm_baseline <proj_work> <baseline_time>
#   Optimize the whole-module O3 IR with no profile.
#   Prints result and writes wm_baseline_time / wm_base_speedup to stdout
#   via the caller's variables.  Returns 1 on failure.
# ---------------------------------------------------------------------------
run_wm_baseline() {
    local proj_work=$1 baseline_time=$2

    $LLVM/opt -passes="default<O3>" \
        "$proj_work/o3.ll" -o "$proj_work/wm_base_final.bc" 2>/dev/null \
        || { echo "  [wm_baseline] opt failed"; return 1; }

    local exe="$RESULTS_DIR/${bench}_wm_baseline"
    $LLVM/clang -O3 "$proj_work/wm_base_final.bc" -o "$exe" -lm 2>/dev/null \
        || { echo "  [wm_baseline] compilation failed"; return 1; }

    wm_baseline_time=$(run_bench "$exe")
    wm_base_speedup=$(echo "scale=3; $baseline_time / $wm_baseline_time" | bc)
    echo "  wm_baseline: ${wm_baseline_time}s (${wm_base_speedup}x)"
}

# ---------------------------------------------------------------------------
# run_wm_traditional <proj_work> <baseline_time>
#   Instrument the whole-module O3 IR, collect a real O3 profile, recompile.
#   This is the oracle ceiling for the projected pipeline.
#   Returns 1 on failure.
# ---------------------------------------------------------------------------
run_wm_traditional() {
    local proj_work=$1 baseline_time=$2

    # Instrument and run to collect a whole-module O3 profile.
    $LLVM/opt -passes="pgo-instr-gen" \
        "$proj_work/o3.ll" -o "$proj_work/wm_trad_inst.bc" 2>/dev/null \
        || { echo "  [wm_traditional] instrumentation failed"; return 1; }
    $LLVM/clang "$proj_work/wm_trad_inst.bc" -fprofile-generate \
        -o "$proj_work/wm_trad_instr_exe" -lm 2>/dev/null \
        || { echo "  [wm_traditional] instrumented build failed"; return 1; }

    LLVM_PROFILE_FILE="$proj_work/wm_trad.profraw" \
        "$BENCH_DIR/src_work/__run" "$BENCH_DIR/src_work" 1 \
        "$proj_work/wm_trad_instr_exe" > /dev/null 2>&1 || true

    $LLVM/llvm-profdata merge "$proj_work/wm_trad.profraw" \
        -o "$proj_work/wm_trad.profdata" 2>/dev/null \
        || { echo "  [wm_traditional] profdata merge failed"; return 1; }

    # Recompile with the collected profile as the oracle O3 PGO binary.
    $LLVM/opt -passes="pgo-instr-use,default<O3>" \
        --pgo-test-profile-file="$proj_work/wm_trad.profdata" \
        "$proj_work/o3.ll" -o "$proj_work/wm_trad_final.bc" 2>/dev/null \
        || { echo "  [wm_traditional] opt with profile failed"; return 1; }

    local exe="$RESULTS_DIR/${bench}_wm_traditional"
    $LLVM/clang -O3 "$proj_work/wm_trad_final.bc" -o "$exe" -lm 2>/dev/null \
        || { echo "  [wm_traditional] compilation failed"; return 1; }

    wm_trad_time=$(run_bench "$exe")
    wm_trad_speedup=$(echo "scale=3; $baseline_time / $wm_trad_time" | bc)
    echo "  wm_trad:     ${wm_trad_time}s (${wm_trad_speedup}x)"
}

# ---------------------------------------------------------------------------
# run_projected <bench_work> <proj_work> <baseline_time>
#   Full Hydra projection pipeline:
#     1. Instrument O0 normalized IR, run, collect edge profiles.
#     2. Project O0 profiles onto O3 block names via HashMatching.
#     3. Inject projected profiles into O3 IR and optimize.
#   Returns 1 on failure at any step.
# ---------------------------------------------------------------------------
run_projected() {
    local bench_work=$1 proj_work=$2 baseline_time=$3

    # Step 1: instrument the O0 normalized IR and build the profiling binary.
    $LLVM/opt -passes="pgo-instr-gen" \
        "$bench_work/normalized.ll" -o "$proj_work/inst.bc" 2>/dev/null \
        || { echo "  [projected] O0 instrumentation failed"; return 1; }
    $LLVM/clang "$proj_work/inst.bc" -fprofile-generate \
        -o "$proj_work/bench_inst" -lm 2>/dev/null \
        || { echo "  [projected] instrumented build failed"; return 1; }

    # Step 2a: run the instrumented O0 binary to collect raw edge counts.
    LLVM_PROFILE_FILE="$proj_work/bench.profraw" \
        "$BENCH_DIR/src_work/__run" "$BENCH_DIR/src_work" 1 \
        "$proj_work/bench_inst" > /dev/null 2>&1 || true

    # Step 2b: merge raw profile into .profdata for pgo-instr-use.
    #    Note: Here you can combine a set of profiles that exercised 
    #          different paths to increase coverage.
    $LLVM/llvm-profdata merge "$proj_work/bench.profraw" \
        -o "$proj_work/bench.profdata" 2>/dev/null \
        || { echo "  [projected] profdata merge failed"; return 1; }

    # Step 2c: annotate the O0 normalized IR with !prof branch_weights.
    $LLVM/opt -S -passes="pgo-instr-use" \
        --pgo-test-profile-file="$proj_work/bench.profdata" \
        "$bench_work/normalized.ll" -o "$proj_work/o0_annotated.ll" 2>/dev/null \
        || { echo "  [projected] pgo-instr-use failed"; return 1; }

    # Step 2d: convert annotated IR into one .prof.full.edges file per function.
    # These carry the O0 edge counts that HashMatching will project onto O3.
    "$PROFDATA_TO_EDGES" "$proj_work/o0_annotated.ll" \
        "$proj_work/o0_profiles" > /dev/null 2>&1 \
        || { echo "  [projected] edge extraction failed"; return 1; }
    echo "  O0 edge profiles: $(ls "$proj_work/o0_profiles"/*.prof.full.edges 2>/dev/null | wc -l) functions"

    # Step 3: project O0 block profiles onto O3 block names via opcode-hash matching.
    # HashMatching compares opcode fingerprints between O0 and O3 basic blocks,
    # then runs flow inference to assign counts to O3 edges.
    $LLVM/opt -disable-output \
        -load-pass-plugin="$HASH_MATCHING" \
        -passes="block-ordering-hash-matching" \
        "$proj_work/o3.ll" \
        -prog "$bench_work/normalized.ll" \
        -prof "$proj_work/o0_profiles" \
        -proj-out "$proj_work/projected_profiles" \
        -matching-threshold 25 2>/dev/null \
        || { echo "  [projected] profile projection failed"; return 1; }
    echo "  projected profiles: $(ls "$proj_work/projected_profiles"/*.prof.full.edges 2>/dev/null | wc -l) functions"

    # Step 4: inject projected edge profiles into the O3 IR as !prof branch_weights
    # metadata, then run default<O3> so the optimizer uses them for block placement,
    # loop unrolling, and inlining decisions.
    $LLVM/opt -load-pass-plugin="$HYDRA_INJECT" \
        -passes="hydra-inject=$proj_work/projected_profiles,default<O3>" \
        "$proj_work/o3.ll" -o "$proj_work/proj_final.bc" 2>/dev/null \
        || { echo "  [projected] injection failed"; return 1; }

    local exe="$RESULTS_DIR/${bench}_projected"
    $LLVM/clang -O3 "$proj_work/proj_final.bc" -o "$exe" -lm 2>/dev/null \
        || { echo "  [projected] final compilation failed"; return 1; }

    projected_time=$(run_bench "$exe")
    proj_speedup=$(echo "scale=3; $baseline_time / $projected_time" | bc)
    echo "  projected:   ${projected_time}s (${proj_speedup}x)"
}

# ---------------------------------------------------------------------------
# Main loop
# ---------------------------------------------------------------------------
mkdir -p "$RESULTS_DIR"
echo "Benchmark,O0(s),Baseline(s),Traditional(s),WM_Baseline(s),WM_Traditional(s),Projected(s),Trad_Speedup,WMBase_Speedup,WMTrad_Speedup,Proj_Speedup" \
    > "$RESULTS_DIR/results.csv"

echo "cBench PGO comparison"
echo "Benchmarks: ${BENCHMARKS[*]}"
echo "Runs per condition: ${NUM_RUNS}"
echo ""

for bench in "${BENCHMARKS[@]}"; do
    echo "--- $bench ---"

    BENCH_DIR="$CBENCH_DIR/$bench"

    if [ ! -d "$BENCH_DIR" ]; then
        echo "  bench dir not found, skipping"
        continue
    fi

    cd "$BENCH_DIR"

    src_files=("$BENCH_DIR/src_work/"*.c)
    src_count=$(ls "$BENCH_DIR/src_work/"*.c 2>/dev/null | wc -l)
    if [ "$src_count" -eq 0 ]; then
        echo "  no source files found, skipping"
        continue
    fi
    echo "  sources: $src_count files"

    bench_work="$RESULTS_DIR/${bench}_bench_work"
    proj_work="$RESULTS_DIR/${bench}_proj_work"
    rm -rf "$bench_work" "$proj_work"
    mkdir -p "$bench_work" "$proj_work/o0_profiles" "$proj_work/projected_profiles"

    # Build the O0 normalized whole-module IR used by all projected pipelines.
    bc_parts=()
    for src_f in "${src_files[@]}"; do
        [ -f "$src_f" ] || continue
        bc="$bench_work/$(basename "${src_f%.c}").bc"
        $LLVM/clang -Xclang -disable-O0-optnone -emit-llvm -c "$src_f" \
            -o "$bc" 2>/dev/null || { echo "  IR generation failed, skipping"; bc_parts=(); break; }
        bc_parts+=("$bc")
    done
    if [ ${#bc_parts[@]} -eq 0 ]; then
        rm -rf "$bench_work" "$proj_work"
        continue
    fi
    $LLVM/llvm-link "${bc_parts[@]}" -o "$bench_work/merged.bc" 2>/dev/null
    $LLVM/opt -S -passes="mem2reg,instnamer,loop-simplify,break-crit-edges" \
        "$bench_work/merged.bc" -o "$bench_work/normalized.ll" 2>/dev/null

    # --- [1/6] O0: unoptimized reference ---
    echo "  [1/6] O0 (unoptimized reference)..."
    o0_time="N/A"
    o0_exe="$RESULTS_DIR/${bench}_o0"
    if $LLVM/clang -O0 "${src_files[@]}" -o "$o0_exe" -lm 2>/dev/null; then
        o0_time=$(run_bench "$o0_exe")
        echo "  o0:          ${o0_time}s"
    else
        echo "  [o0] compilation failed"
    fi

    # --- [2/6] baseline: clang -O3 per-TU, no profile ---
    echo "  [2/6] baseline (O3 per-TU, no profile)..."
    baseline_time="N/A"
    baseline_exe="$RESULTS_DIR/${bench}_baseline"
    if ! $LLVM/clang -O3 "${src_files[@]}" -o "$baseline_exe" -lm 2>/dev/null; then
        echo "  [baseline] compilation failed, skipping benchmark"
        rm -rf "$bench_work" "$proj_work"
        continue
    fi
    baseline_time=$(run_bench "$baseline_exe")
    echo "  baseline:    ${baseline_time}s"

    # --- [3/6] traditional: clang -O3 per-TU with real O3 PGO profile ---
    # Same source files as baseline so the comparison is scope-equivalent.
    echo "  [3/6] traditional PGO (per-TU)..."
    traditional_time="N/A"
    trad_speedup="N/A"
    local_loop_wrap=$(awk 'NR==5{print}' "$BENCH_DIR/src_work/_ccc_info_datasets" 2>/dev/null || echo "1")
    echo "$local_loop_wrap" > "$BENCH_DIR/src_work/_finfo_dataset"
    if $LLVM/clang -O3 -fprofile-instr-generate \
            "${src_files[@]}" -o "$bench_work/trad_instr_exe" -lm 2>/dev/null; then
        LLVM_PROFILE_FILE="$RESULTS_DIR/${bench}_trad.profraw" \
            "$BENCH_DIR/src_work/__run" "$BENCH_DIR/src_work" 1 \
            "$bench_work/trad_instr_exe" > /dev/null 2>&1 || true
        if $LLVM/llvm-profdata merge "$RESULTS_DIR/${bench}_trad.profraw" \
                -o "$RESULTS_DIR/${bench}_trad.profdata" 2>/dev/null; then
            trad_exe="$RESULTS_DIR/${bench}_traditional"
            if $LLVM/clang -O3 -fprofile-instr-use="$RESULTS_DIR/${bench}_trad.profdata" \
                    "${src_files[@]}" -o "$trad_exe" -lm 2>/dev/null; then
                traditional_time=$(run_bench "$trad_exe")
                trad_speedup=$(echo "scale=3; $baseline_time / $traditional_time" | bc)
                echo "  traditional: ${traditional_time}s (${trad_speedup}x)"
            fi
        fi
    fi

    # --- [4/6] wm_baseline: whole-module O3, no profile ---
    echo "  [4/6] whole-module baseline (no profile)..."
    wm_baseline_time="N/A"
    wm_base_speedup="N/A"
    wm_trad_time="N/A"
    wm_trad_speedup="N/A"
    projected_time="N/A"
    proj_speedup="N/A"

    # Build the shared O3 whole-module IR (o3.ll) used by all three wm pipelines.
    if build_o3_module "$proj_work"; then
        if run_wm_baseline "$proj_work" "$baseline_time"; then
            # --- [5/6] wm_traditional: whole-module O3 with real O3 profile (oracle) ---
            echo "  [5/6] whole-module traditional PGO (oracle)..."
            run_wm_traditional "$proj_work" "$baseline_time" || true

            # --- [6/6] projected: Hydra O0->O3 projection ---
            echo "  [6/6] projected PGO..."
            run_projected "$bench_work" "$proj_work" "$baseline_time" || true
        fi
    fi

    echo "$bench,$o0_time,$baseline_time,$traditional_time,$wm_baseline_time,$wm_trad_time,$projected_time,$trad_speedup,$wm_base_speedup,$wm_trad_speedup,$proj_speedup" \
        >> "$RESULTS_DIR/results.csv"

    rm -rf "$proj_work" "$bench_work"
    echo ""
done

# ---------------------------------------------------------------------------
# Results table and analysis
# ---------------------------------------------------------------------------
echo "Results:"
column -t -s ',' "$RESULTS_DIR/results.csv"
echo ""
echo "Full results: $RESULTS_DIR/results.csv"
echo ""
echo "Pipelines:"
echo "  o0             = clang -O0 per-TU, unoptimized reference"
echo "  baseline       = clang -O3 per-TU, no profile"
echo "  traditional    = clang -O3 per-TU, real O3 PGO profile"
echo "  wm_baseline    = llvm-link + opt default<O3>, no profile  (LTO effect only)"
echo "  wm_traditional = llvm-link + opt pgo-instr-use + default<O3>  (oracle ceiling)"
echo "  projected      = llvm-link + O0 profile projected to O3 + hydra-inject + default<O3>"
echo ""

echo "========================================================================"
echo " Analysis (per benchmark)"
echo "========================================================================"
tail -n +2 "$RESULTS_DIR/results.csv" | while IFS=',' read bench o0 base trad wm_base wm_trad proj \
        trad_sp wmbase_sp wmtrad_sp proj_sp; do
    spd() {
        [ "$1" = "N/A" ] || [ "$2" = "N/A" ] && echo "N/A" && return
        echo "scale=2; $1 / $2" | bc
    }
    echo ""
    echo "  $bench"
    printf "    %-54s %s\n" "projected vs o0          (speedup over unoptimized):"  "$(spd $o0      $proj)x"
    printf "    %-54s %s\n" "projected vs baseline    (total Hydra benefit):"        "$(spd $base    $proj)x"
    printf "    %-54s %s\n" "wm_baseline vs baseline  (LTO alone, no profile):"     "$(spd $base    $wm_base)x"
    printf "    %-54s %s\n" "projected vs wm_baseline (profile contribution only):"  "$(spd $wm_base $proj)x"
    printf "    %-54s %s\n" "projected vs wm_trad     (Hydra accuracy vs oracle):"   "$(spd $wm_trad $proj)x"
done

echo ""
echo "========================================================================"
echo " Ranked summary: Hydra total benefit (projected vs baseline), best first"
echo "========================================================================"
printf "  %-26s %8s %8s %8s %8s %8s\n" \
    "Benchmark" "vs_O0" "vs_Base" "LTO_only" "Prof_only" "vs_Oracle"
echo "  --------------------------------------------------------------------------"
tail -n +2 "$RESULTS_DIR/results.csv" \
  | awk -F',' '
    function spd(a, b,    r) {
        if (a == "N/A" || b == "N/A" || b+0 == 0) return "N/A"
        return sprintf("%.2f", a/b)
    }
    {
        vs_o0     = spd($2, $7)   # O0 / projected
        vs_base   = spd($3, $7)   # baseline / projected
        lto_only  = spd($3, $5)   # baseline / wm_baseline
        prof_only = spd($5, $7)   # wm_baseline / projected
        vs_oracle = spd($6, $7)   # wm_traditional / projected
        key = ($3+0 > 0 && $7+0 > 0) ? $3/$7 : 0
        printf "%s|%s|%s|%s|%s|%s|%.4f\n",
            $1, vs_o0, vs_base, lto_only, prof_only, vs_oracle, key
    }' \
  | sort -t'|' -k7 -rn \
  | awk -F'|' '{ printf "  %-26s %8sx %8sx %8sx %8sx %8sx\n",
      $1, $2, $3, $4, $5, $6 }'
echo ""
