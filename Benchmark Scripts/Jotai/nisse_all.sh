#!/usr/bin/env bash

export BENCH_DIR=~/Codes/merlin/tests/jotai_benchmarks
export RESULTS_DIR="../../Benchmark Results/merlin/jotai_benchmarks"
export JSON_FILE="../../JSON Files/jotaiMerlinResults.json"
NISSE_SCRIPT=../nisse_profiler.sh
PYTHON_SCRIPT=get_angha_results.py
PYTHON_PROCESS_SCRIPT=process_angha_results.py

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
            bash $NISSE_SCRIPT $f $i > /dev/null 2>&1
        fi
        COUNTER=`expr $COUNTER + 1`
    done
    python3 $PYTHON_SCRIPT $i
done

rm a.out

python3 $PYTHON_PROCESS_SCRIPT
