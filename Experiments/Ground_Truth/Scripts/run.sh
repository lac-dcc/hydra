#!/bin/bash

EXP="Flags/o0"
OPT_FLAG="disable-O0-optnone"
PASSES=""
NUM_INPUTS=20

TEMP=$(getopt -o '' --long exp-name:,opt-flag:,passes:,inputs: -n "$0" -- "$@")

if [[ $? != 0 ]]
then
    echo "Terminating..." >&2
    exit 1
fi

eval set -- $TEMP

while true
do
    case "$1" in
        --exp-name) EXP="$2"; shift 2 ;;
        --opt-flag) OPT_FLAG="$2"; shift 2 ;;
        --passes) PASSES="$2"; shift 2 ;;
        --inputs) NUM_INPUTS=$2; shift 2 ;;
        --) shift; break ;;
        *) echo "Internal error!"; exit 1 ;;
    esac
done

if [[ -z "$EXP" || -z "$OPT_FLAG" ]]
then
    echo "Usage: $0 --exp-name <name> --opt-flag <opt flag> --passes <passes>"
    exit 1
fi

echo "Running Nisse with the following options:"
echo "Experiment name: $EXP"
echo "Optimization flag: $OPT_FLAG"
echo "Optimization passes: $PASSES"
echo "Number of inputs: $NUM_INPUTS"

export EXP
export OPT_FLAG
export PASSES
export NUM_INPUTS

export LLVM_INSTALL_DIR="/usr/local"
export SCRIPTS_FOLDER="$BASE_DIR/Experiments/Ground_Truth/Scripts"

echo "Running nisse_all script"
bash "$SCRIPTS_FOLDER/nisse_all.sh"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "Internal error"
    echo "Terminating..."
    exit 1
fi