#!/usr/bin/env bash

export BASE_DIR=/home/jvf/Codes/hydra
export BENCH_DIR="$BASE_DIR/Benchmark/Jotai"
export RESULTS_DIR="$BASE_DIR/Benchmark Results/merlin/jotai_benchmarks"
export JSON_FILE="$BASE_DIR/JSON Files/jotaiMerlinResults2.json"
CURRENT_DIR=$(pwd)
SCRIPTS_FOLDER="$BASE_DIR/Benchmark Scripts"
NISSE_SCRIPT="$SCRIPTS_FOLDER/nisse_profiler.sh"
PYTHON_SCRIPTS="$SCRIPTS_FOLDER/Jotai"

for i in {0..5}
do
    echo "running $i/5"
    COUNTER=1
    rm -rf $BENCH_DIR/*.profiling
    for f in $(ls $BENCH_DIR/*.c)
    do
        if [ `expr $COUNTER % 100` -eq 0 ]
        then
            echo "$COUNTER/$(ls $BENCH_DIR/*.c | wc -l)"
        fi
        clang $f -o a.out > /dev/null 2>&1
        MAX=`expr $(./a.out | wc -l) - 6`
        if [ $MAX -ge $i ]
        then
            bash "$NISSE_SCRIPT" $f $i > /dev/null 2>&1
        fi
        COUNTER=`expr $COUNTER + 1`
    done
    cd "$PYTHON_SCRIPTS"
    python3 get_results.py $i
    cd "$CURRENT_DIR"
done

rm a.out

cd "$PYTHON_SCRIPTS"
python3 process_results.py
cd "$CURRENT_DIR"
