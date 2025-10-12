#!/bin/bash

# Runs profile projection with same optimizations

# Example:
# ./mem_profiler.sh ../../tests/simple_array.c

if [ $# -lt 1 ]
then
    echo "Syntax: runBOProfileProjection.sh [BENCHMARK_DIRECTORY]"
    exit 1
fi

# export LLVM_INSTALL_DIR="/usr/local"
# export BASE_DIR="/home/jvf/Codes/Hydra"

OLD_FOLDER="o0"
if [ $OLD_OPT = "O1" ]
then
    OLD_FOLDER="o1"
elif [ $OLD_OPT = "O2" ]
then
    OLD_FOLDER="o2"
elif [ $OLD_OPT = "O3" ]
then
    OLD_FOLDER="o3"
fi

NEW_FOLDER="o0"
if [ $NEW_OPT = "O1" ]
then
    NEW_FOLDER="o1"
elif [ $NEW_OPT = "O2" ]
then
    NEW_FOLDER="o2"
elif [ $NEW_OPT = "O3" ]
then
    NEW_FOLDER="o3"
fi


LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
CLANG="$LLVM_INSTALL_DIR/bin/clang"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis

NISSE_SCRIPT="$SCRIPTS_FOLDER/nisse.sh"

PASS_FILE_PROFILE=$BASE_DIR/build/lib/libBlockOrderingAyupov.so
# CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

RESULTS_FOLDER=$BASE_DIR/Results/Profile

rm -rf tmp
mkdir -p tmp
cd tmp
DIR_NAME=$(dirname $1)
BENCH_NAME=$(basename $1)
# DIR_NAME=$(dirname $1)
# FL_NAME=$(basename $1)
# FILE=$(basename $1 .c)

# echo $(pwd)
# echo $DIR_NAME/$FL_NAME

# exit 0

OLD_PROFILES="$PROF_FILES/Old/$EXP/$BENCH_NAME"
OLD_LL_FILE="$LL_FILES/Old/$EXP/$BENCH_NAME.ll"
NEW_LL_FILE="$LL_FILES/New/$EXP/$BENCH_NAME.ll"

if [ ! -d "$OLD_PROFILES" ] || [ ! -f "$OLD_LL_FILE" ]
then
    mkdir -p $OLD_PROFILES
    mkdir -p $(dirname "$OLD_LL_FILE")
    bash "$NISSE_SCRIPT" $DIR_NAME/$BENCH_NAME # > /dev/null 2>&1
    ret_code=$?
    if [[ $ret_code -ne 0 ]]; then
        echo "Nisse failed"
        cd -
        echo $BENCH_NAME >> err.txt
        exit $ret_code
    fi
    mv $DIR_NAME/$BENCH_NAME.profiling .

    LL_FILE=$BENCH_NAME.profiling/compiled/$BENCH_NAME.ll
    PROFILES=$BENCH_NAME.profiling/profiles

    cp $LL_FILE "$OLD_LL_FILE"
    cp $PROFILES/* "$OLD_PROFILES"
fi

if [ ! -f "$NEW_LL_FILE" ]
then
    mkdir -p $(dirname "$NEW_LL_FILE")
    cp $DIR_NAME/$BENCH_NAME/src_work/*.c $DIR_NAME/$BENCH_NAME/src_work/*.h .
    $CLANG -Xclang -"$NEW_OPT" -flto -emit-llvm -c *.c
    ret_code=$?
    if [[ $ret_code -ne 0 ]]; then
        echo "Compilation failed"
        cd -
        echo $BENCH_NAME >> err.txt
        exit $ret_code
    fi
    $LLVM_LINK *.o -o "$BENCH_NAME.bc"
    $LLVM_DIS "$BENCH_NAME.bc" -o "$BENCH_NAME.ll"
    $LLVM_OPT -S -passes="mem2reg,instnamer" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"

    for PASS in $PRE_PASSES
    do
        $LLVM_OPT -S -passes="$PASS" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"
    done

    # Apply other optmizations
    for PASS in $PASSES
    do
        $LLVM_OPT -S -passes="$PASS" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"
    done

    $LLVM_OPT -S -passes="loop-simplify,break-crit-edges" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"

    cp "$BENCH_NAME.ll" "$NEW_LL_FILE"
fi

START_TIME=`date +%s.%N`
$LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PROFILE \
    -passes="block-ordering-ayupov" "$NEW_LL_FILE" -prog "$OLD_LL_FILE" \
    -prof "$OLD_PROFILES" -matching-threshold $THRESHOLD -max-iterations $MAX_ITER
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
    echo "Pass failed"
    cd -
    echo $BENCH_NAME >> err.txt
    exit $ret_code
fi
END_TIME=`date +%s.%N`
RUNTIME=$( echo "$END_TIME - $START_TIME" | bc -l )

rm -rf $RESULTS_FOLDER/$BENCH_NAME
mkdir -p $RESULTS_FOLDER/$BENCH_NAME
mv *-profile.txt $RESULTS_FOLDER/$BENCH_NAME/.
echo $RUNTIME > $RESULTS_FOLDER/$BENCH_NAME/execution_time.txt

cd ..
# rm -rf tmp
