#!/bin/bash

BASE_DIR="/home/jvf/Codes/hydra"

# simplifycfg
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="simplifycfg" --new-passes="simplifycfg lcssa loop-rotate"
exit 0

# empty
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh"

# iv-licm
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="iv-licm" --new-passes="indvars licm"

# loop-vectorize
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="lv" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-vectorize indvars lcssa"

# inlining
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="inlining" --pre-passes="simplifycfg lcssa loop-rotate globalopt dce" --new-passes="inline"

# O1
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="o1" --new-opt="O1"

# O2
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="o2" --new-opt="O2"

# O3
"$BASE_DIR/Cross Experiments/cBench/scripts/runExperiment.sh" --exp-folder="o3" --new-opt="O3"

