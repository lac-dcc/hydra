#!/usr/bin/env bash

# Example:
# ./mem_profiler.sh ../../tests/simple_array.c

if [ $# -lt 1 ]
then
    echo Syntax: regions_ex file.c
    exit 1
fi

# LLVM tools:
#
source "$BASE_DIR/Benchmark_Scripts/config.sh"

LLVM_OPT=$LLVM_INSTALL_DIR/bin/opt
LLVM_CLANG=$LLVM_INSTALL_DIR/bin/clang
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
PROFILER_IMPL=$NISSE_SOURCE_DIR/lib/prof.c
MY_LLVM_LIB=$NISSE_BUILD_DIR/lib/libNisse.so
PROP_BIN=$NISSE_BUILD_DIR/bin/propagation

# Move to folder where the file is:
#
DR_NAME="$(dirname $1)"
cd $DR_NAME
echo $(pwd)

# File names:
#
BENCH_NAME=$(basename $1)
PROF_DIR="$(pwd)/$BENCH_NAME.no.profiling"
BC_NAME="$BENCH_NAME.bc"
LL_NAME="$BENCH_NAME.ll"
PF_NAME="$BENCH_NAME.profiled.ll"
INFO_PROF="info.prof"
MAIN_PROF="main.prof"
PROF_SUF=".prof.full"
EXE_LOG="execution.log"


# Create the profiling folder:
#
if [ -d "$PROF_DIR" ]; then
  rm -r "$PROF_DIR"
fi
mkdir $PROF_DIR
cd $BENCH_NAME/src_work

# CLANG_FLAGS="-Xclang -disable-O0-optnone -std=c99 -c -S -emit-llvm"

# Generating a single bytecode for the benchmark in SSA form:
#
$LLVM_CLANG -Xclang -disable-O0-optnone -flto -fuse-ld=lld -lm *.c -o $PROF_DIR/$BENCH_NAME
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
    echo "Compilation failed"
    cd -
    echo $BENCH_NAME >> err.txt
    exit $ret_code
fi

cd $PROF_DIR

# Run the instrumented binary:
#
if [ $# -ge 2 ]
then
  $DR_NAME/$BENCH_NAME/src_work/__run $DR_NAME/$BENCH_NAME/src_work $2 $PROF_DIR/$BENCH_NAME > $EXE_LOG 2>&1
else
  $DR_NAME/$BENCH_NAME/src_work/__run $DR_NAME/$BENCH_NAME/src_work 1 $PROF_DIR/$BENCH_NAME > $EXE_LOG 2>&1
fi

mkdir profiles compiled partial_profiles

# Move the files to apropriate folders
#

mv $EXE_LOG profiles/

mv $BENCH_NAME compiled/

# Go back to the folder where you were before:
#
cd -