#!/usr/bin/bash

# Example:
# ./mem_profiler.sh ../../tests/simple_array.c

if [ $# -lt 1 ]
then
    echo "Syntax: regions_ex file.c [INPUT]"
    exit 1
fi

# LLVM tools:
#
source "$BASE_DIR/Benchmark Scripts/config.sh"

LLVM_OPT=$LLVM_INSTALL_DIR/bin/opt
LLVM_CLANG=$LLVM_INSTALL_DIR/bin/clang
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
FL_NAME=$(basename $1)
BS_NAME=$(basename $FL_NAME .c)
PROF_DIR=$FL_NAME.no.profiling
LL_NAME="$BS_NAME.ll"
PF_NAME="$BS_NAME.profiled.ll"
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
cd $PROF_DIR

CLANG_FLAGS="-Xclang -disable-O0-optnone -std=c99 -c -S -emit-llvm"

# Generating the bytecode in SSA form:
#
$LLVM_CLANG -Xclang -disable-O0-optnone -std=c99 ../$FL_NAME -o $BS_NAME
if [[ $ret_code -ne 0 ]]; then
  echo "Compilation failed"
  cd -
  echo $FL_NAME >> err.txt
  exit $ret_code
fi

# Run the instrumented binary:
#
START_TIME=`date +%s.%N`
if [ $# -ge 2 ]
then
  ./$BS_NAME $2
else
  ./$BS_NAME 0
fi
END_TIME=`date +%s.%N`
RUNTIME=$( echo "$END_TIME - $START_TIME" | bc -l )
echo $RUNTIME > $EXE_LOG
# Prepare the result folders
#
mkdir profiles compiled

mv $EXE_LOG profiles/

mv $BS_NAME compiled/

# Go back to the folder where you were before:
#
cd -