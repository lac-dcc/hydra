#!/bin/bash

# Experiment for profile projection
# From:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify
# To:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify, indvars, licm

export EXP_FOLDER="iv-licm"
export PASSES="indvars licm"

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"
CUR_DIR="$BASE_DIR/Cross Experiments/Jotai/$EXP_FOLDER"

echo "Running nisse_all script"
bash "$CUR_DIR/Jotai/nisse_all.sh"

echo "Running hot block prediction heuristics"
bash "$CUR_DIR/runHotBlock.sh"

echo "Generating CSV file"
python3 "$CUR_DIR/genHBPCsv.py"