#!/bin/bash

BASE_DIR="/home/jvf/Codes/hydra"
CROSS_EXPERIMENTS="empty inlining iv-licm lv o1 o2 o3"

for EXP in $CROSS_EXPERIMENTS
do
    bash "$BASE_DIR/Cross Experiments/cBench/$EXP/runExperiment.sh"
done