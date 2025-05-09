#!/bin/bash

# Runs profile projection with same optimizations

# Example:
# ./mem_profiler.sh ../../tests/simple_array.c

if [ $# -lt 1 ]
then
    echo "Syntax: runHBProfileProjection.sh [BENCHMARK_DIRECTORY]"
    exit 1
fi

# export LLVM_INSTALL_DIR="/usr/local"
# export BASE_DIR="/home/jvf/Codes/hydra"


LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
CLANG="$LLVM_INSTALL_DIR/bin/clang"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis

NISSE_SCRIPT="$SCRIPT_DIR/nisse_profiler_projection.sh"

PASS_FILE_PROFILE=$BASE_DIR/build/lib/libHotBlockProfile.so
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

bash "$NISSE_SCRIPT" $DIR_NAME/$BENCH_NAME
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

cp $DIR_NAME/$BENCH_NAME/src_work/*.c $DIR_NAME/$BENCH_NAME/src_work/*.h .
$CLANG -Xclang -"$NEW_OPT" -flto -emit-llvm -c *.c
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
    echo "Compilation failed"
    cd -
    echo $BENCH_NAME >> err.txt
    exit $ret_code
fi
$LLVM_LINK *o -o "$BENCH_NAME.bc"
$LLVM_DIS "$BENCH_NAME.bc" -o "$BENCH_NAME.ll"
$LLVM_OPT -S -passes="mem2reg,instnamer" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"
$LLVM_OPT -S -passes="loop-simplify,break-crit-edges" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"

for PASS in $PRE_PASSES
do
    $LLVM_OPT -S -passes="$PASS" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"
done

# Apply other optmizations
for PASS in $PASSES
do
    $LLVM_OPT -S -passes="$PASS" "$BENCH_NAME.ll" -o "$BENCH_NAME.ll"
done

# mkdir -p /tmp/$BENCH_NAME
# cp -r $PROFILES /tmp/$BENCH_NAME
# cp $LL_FILE /tmp/$BENCH_NAME

START_TIME=`date +%s.%N`
$LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PROFILE \
    -passes="hotblock-profile" "$BENCH_NAME.ll" -prog $LL_FILE -prof $PROFILES
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
rm -rf tmp
