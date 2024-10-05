#!/usr/bin/env bash

export BASE_DIR=~/Codigos/hydra
export BENCH_DIR="$BASE_DIR/Benchmark/cBench"
export RESULTS_DIR="$BASE_DIR/Benchmark Results/cBench/cBench_benchmarks"
export JSON_FILE="$BASE_DIR/JSON Files/cBenchResults.json"
CURRENT_DIR=$(pwd)
SCRIPTS_FOLDER="$BASE_DIR/Benchmark Scripts"
NISSE_SCRIPT="$SCRIPTS_FOLDER/nisse_profiler_cbench.sh"
PYTHON_SCRIPTS="$SCRIPTS_FOLDER/cBench"

BENCHMARKS=$(ls $BENCH_DIR)

cd $BENCH_DIR
bash all__delete_work_dirs
bash all__create_work_dirs
cd $CURRENT_DIR

for i in {1..20}
do
    echo "running dataset $i/20"
    for d in $(ls $BENCH_DIR)
    do 
        if [ -d $BENCH_DIR/$d ]
        then
            if [ "$d" = "automotive_bitcount" ]; then continue; fi
            if [ "$d" = "automotive_qsort1" ]; then continue; fi
            if [ "$i" = "consumer_mad" ]; then continue; fi
            if [ "$i" = "office_ghostscript" ]; then continue; fi
            if [ "$i" = "office_ispell" ]; then continue; fi
            if [ "$i" = "security_pgp_d" ]; then continue; fi
            if [ "$i" = "security_pgp_e" ]; then continue; fi
            if [ $(ls $BENCH_DIR/$d | grep src_work | wc -l) = 1 ]
            then
                echo "running benchmark $d"
                bash "$NISSE_SCRIPT" $BENCH_DIR/$d $i
            fi
        fi
    done
done
