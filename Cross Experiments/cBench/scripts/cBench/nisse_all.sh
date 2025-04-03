#!/usr/bin/env bash

export BASE_DIR=/home/jvf/Codes/hydra
export BENCH_DIR="$BASE_DIR/Benchmark/cBench"
export RESULTS_DIR="$BASE_DIR/Benchmark Results/cBench/cBench_benchmarks"
export JSON_FILE="$BASE_DIR/Cross Experiments/cBench/$EXP_FOLDER/JSON Files/cBenchResults.json"
CURRENT_DIR=$(pwd)
SCRIPTS_FOLDER="$BASE_DIR/Cross Experiments/cBench/scripts"
NISSE_SCRIPT="$SCRIPTS_FOLDER/runNisse.sh"
PYTHON_SCRIPTS="$SCRIPTS_FOLDER/cBench"

BENCHMARKS=$(ls $BENCH_DIR)

cd $BENCH_DIR
bash all__delete_work_dirs > /dev/null 2>&1
bash all__create_work_dirs > /dev/null 2>&1
cd $CURRENT_DIR

rm -rf "$RESULTS_DIR"

for i in {1..20}
do
    echo "running dataset $i/20"
    rm -rf $BENCH_DIR/*.profiling
    for d in $(ls $BENCH_DIR)
    do 
        if [ -d $BENCH_DIR/$d ]
        then
            # Runtime error with Nisse
            if [[ $d =~ ^"consumer" ]]; then continue; fi
            if [ "$d" = "security_rijndael_e" ]; then continue; fi

            # Runtime error
            if [ "$d" = "office_ispell" ]; then continue; fi
            if [ "$d" = "security_rijndael_e" ]; then continue; fi
            
            # Compilation error
            if [ "$d" = "consumer_mad" ]; then continue; fi
            if [ "$d" = "office_ghostscript" ]; then continue; fi
            if [ "$d" = "office_rsynth" ]; then continue; fi
            if [ "$d" = "security_pgp_d" ]; then continue; fi
            if [ "$d" = "security_pgp_e" ]; then continue; fi
            if [ "$d" = "telecom_gsm" ]; then continue; fi

            if [ $(ls $BENCH_DIR/$d | grep src_work | wc -l) = 1 ]
            then
                echo "running benchmark $d"
                bash "$NISSE_SCRIPT" $BENCH_DIR/$d $i # > /dev/null 2>&1
                ret_code=$?
                if [[ $ret_code -ne 0 ]]
                then
                    echo "Benchmark $d failed"
                    exit 1
                fi
            fi
        fi
    done
    cd "$PYTHON_SCRIPTS"
    python3 get_results.py $i
    cd "$CURRENT_DIR"
done

cd "$PYTHON_SCRIPTS"
python3 process_results.py
cd "$CURRENT_DIR"
