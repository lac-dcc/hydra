#!/bin/bash

# Runs profile projection with same optimizations

# Example:
# ./mem_profiler.sh ../../tests/simple_array.c

if [ $# -lt 1 ]
then
    echo "Syntax: runHBProfileProjection.sh [SOURCE_FILE]"
    exit 1
fi

LLVM_INSTALL_DIR="/usr/local"
BASE_DIR="/home/jvf/Codes/hydra"

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
CLANG="$LLVM_INSTALL_DIR/bin/clang"

NISSE_SCRIPT="$BASE_DIR/Benchmark_Scripts/nisse_profiler.sh"

PASS_FILE_PROFILE=$BASE_DIR/build/lib/libHotBlockProfile.so
CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

RESULTS_FOLDER=$BASE_DIR/Results/Profile

mkdir -p tmp
cd tmp
DIR_NAME=$(dirname $1)
FL_NAME=$(basename $1)
FILE=$(basename $1 .c)

bash "$NISSE_SCRIPT" $DIR_NAME/$FL_NAME
mv $DIR_NAME/$FL_NAME.profiling .

LL_FILE=$FL_NAME.profiling/compiled/$FILE.ll
PROFILES=$FL_NAME.profiling/profiles

$CLANG $CFLAGS $DIR_NAME/$FL_NAME -o $FILE.ll
$LLVM_OPT -S -passes="mem2reg,instnamer" $FILE.ll -o $FILE.ll
$LLVM_OPT -S -passes="loop-simplify,break-crit-edges" $FILE.ll -o $FILE.ll
$LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PROFILE \
    -passes="hotblock-profile" $FILE.ll -prog $LL_FILE -prof $PROFILES
rm -rf $RESULTS_FOLDER/$FL_NAME
mkdir -p $RESULTS_FOLDER/$FL_NAME
mv *-profile.txt $RESULTS_FOLDER/$FL_NAME/.

cd ..
rm -rf tmp