#!/usr/bin/env bash

export BASE_DIR=/home/jvf/Codes/hydra
export BENCH_DIR="$BASE_DIR/Benchmark/Jotai"
export RESULTS_DIR="$BASE_DIR/Benchmark_Results/merlin/jotai_benchmarks"
export JSON_FILE="$BASE_DIR/Cross_Experiments/Jotai/$EXP_FOLDER/JSON_Files/jotaiMerlinResults.json"
CURRENT_DIR=$(pwd)
SCRIPTS_FOLDER="$BASE_DIR/Cross_Experiments/Jotai/$EXP_FOLDER"
NISSE_SCRIPT="$SCRIPTS_FOLDER/runNisse.sh"
PYTHON_SCRIPTS="$SCRIPTS_FOLDER/Jotai"

rm -rf "$RESULTS_DIR"

for i in {0..0}
do
    echo "running $i/0"
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
