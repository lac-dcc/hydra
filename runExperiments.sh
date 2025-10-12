#!/bin/bash

if [ -z $BASE_DIR ]
then
    export BASE_DIR="/home/elisa/Codes/hydra"
fi

# Experiment 1:
# Optimization flags experiments

# # Part 1: Run Nisse and generate the ground truth

# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Flags/o0" --opt-flag="disable-O0-optnone" --passes=""

# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Flags/o1" --opt-flag="O1" --passes=""

# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Flags/o2" --opt-flag="O2" --passes=""

# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Flags/o3" --opt-flag="O3" --passes=""


# # Part 2: Run the profile prediction algorithms

# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="o0" --opt-flag="disable-O0-optnone" --passes=""

# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="o1" --opt-flag="O1" --passes=""

# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="o2" --opt-flag="O2" --passes=""

# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="o3" --opt-flag="O3" --passes=""


# # Part 3: Run the profile projection algorithms (just hydra for now)

for OLD in o0 o1 o2 o3
do
    for NEW in o0 o1 o2 o3
    do
        OLD_OPT=$OLD
        NEW_OPT=$NEW
        if [ $OLD_OPT = "o0" ]
        then
            OLD_OPT="disable-O0-optnone"
        elif [ $OLD_OPT = "o1" ]
        then
            OLD_OPT="O1"
        elif [ $OLD_OPT = "o2" ]
        then
            OLD_OPT="O2"
        elif [ $OLD_OPT = "o3" ]
        then
            OLD_OPT="O3"
        fi
        if [ $NEW_OPT = "o0" ]
        then
            NEW_OPT="disable-O0-optnone"
        elif [ $NEW_OPT = "o1" ]
        then
            NEW_OPT="O1"
        elif [ $NEW_OPT = "o2" ]
        then
            NEW_OPT="O2"
        elif [ $NEW_OPT = "o3" ]
        then
            NEW_OPT="O3"
        fi
        "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="$OLD/$NEW" --old-opt="$OLD_OPT" --new-opt="$NEW_OPT" --matching-threshold="25"
    done
done

# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="o0/o0" --old-opt="disable-O0-optnone" --new-opt="disable-O0-optnone" --matching-threshold="25"

# Experiment 2: Opt passes experiment
# List of optimizations retired from https://homepages.dcc.ufmg.br/~fernando/publications/papers/FaustinoCC21.pdf

# # Part 1: Run Nisse and generate the ground truth

# # simplifycfg
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/simplifycfg" --opt-flag="disable-O0-optnone" --passes="simplifycfg" --inputs=1

# # instcombine
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/instcombine" --opt-flag="disable-O0-optnone" --passes="instcombine" --inputs=1

# # early-cse-memssa
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/early-cse-memssa" --opt-flag="disable-O0-optnone" --passes="early-cse-memssa" --inputs=1

# # gvn
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/gvn" --opt-flag="disable-O0-optnone" --passes="gvn" --inputs=1

# # sroa
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/sroa" --opt-flag="disable-O0-optnone" --passes="sroa" --inputs=1

# # jump-threading
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/jump-threading" --opt-flag="disable-O0-optnone" --passes="jump-threading" --inputs=1

# # mem2reg
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/mem2reg" --opt-flag="disable-O0-optnone" --passes="mem2reg" --inputs=1

# # licm
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/licm" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate licm" --inputs=1

# # loop-rotate
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-rotate" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate" --inputs=1

# # indvars
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/indvars" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate indvars" --inputs=1

# # correlated-propagation
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/correlated-propagation" --opt-flag="disable-O0-optnone" --passes="correlated-propagation" --inputs=1

# # mldst-motion
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/mldst-motion" --opt-flag="disable-O0-optnone" --passes="mldst-motion" --inputs=1

# # reassociate
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/reassociate" --opt-flag="disable-O0-optnone" --passes="reassociate" --inputs=1

# # slp-vectorizer
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/slp-vectorizer" --opt-flag="disable-O0-optnone" --passes="slp-vectorizer" --inputs=1

# # tailcallelim
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/tailcallelim" --opt-flag="disable-O0-optnone" --passes="tailcallelim" --inputs=1

# # dse
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/dse" --opt-flag="disable-O0-optnone" --passes="dse" --inputs=1

# # inferattrs
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/inferattrs" --opt-flag="disable-O0-optnone" --passes="inferattrs" --inputs=1

# # speculative-execution
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/speculative-execution" --opt-flag="disable-O0-optnone" --passes="speculative-execution" --inputs=1

# # memcpyopt
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/memcpyopt" --opt-flag="disable-O0-optnone" --passes="memcpyopt" --inputs=1

# # instsimplify
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/instsimplify" --opt-flag="disable-O0-optnone" --passes="instsimplify" --inputs=1

# # ipsccp
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/ipsccp" --opt-flag="disable-O0-optnone" --passes="ipsccp" --inputs=1

# # adce
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/adce" --opt-flag="disable-O0-optnone" --passes="adce" --inputs=1

# # bdce
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/bdce" --opt-flag="disable-O0-optnone" --passes="bdce" --inputs=1

# # loop-unroll
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-unroll" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate loop-unroll" --inputs=1

# # aggressive-instcombine
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/aggressive-instcombine" --opt-flag="disable-O0-optnone" --passes="aggressive-instcombine" --inputs=1

# # simple-loop-unswitch
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/simple-loop-unswitch" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate simple-loop-unswitch" --inputs=1

# # globalopt
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/globalopt" --opt-flag="disable-O0-optnone" --passes="globalopt" --inputs=1

# # sccp
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/sccp" --opt-flag="disable-O0-optnone" --passes="sccp" --inputs=1

# # loop-deletion
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-deletion" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate loop-deletion" --inputs=1

# # loop-idiom
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-idiom" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate loop-idiom" --inputs=1

# # loop-sink
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-sink" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate loop-sink" --inputs=1

# # loop-vectorize
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-vectorize" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate loop-vectorize" --inputs=1

# # loop-load-elim
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-load-elim" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate loop-load-elim" --inputs=1

# # div-rem-pairs
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/div-rem-pairs" --opt-flag="disable-O0-optnone" --passes="div-rem-pairs" --inputs=1

# # loop-simplify
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/loop-simplify" --opt-flag="disable-O0-optnone" --passes="loop-simplify" --inputs=1

# # globals-aa
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/globals-aa" --opt-flag="disable-O0-optnone" --passes="globals-aa" --inputs=1

# # strip-dead-prototypes
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/strip-dead-prototypes" --opt-flag="disable-O0-optnone" --passes="strip-dead-prototypes" --inputs=1

# # lower-constant-intrinsics
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/lower-constant-intrinsics" --opt-flag="disable-O0-optnone" --passes="lower-constant-intrinsics" --inputs=1

# # lcssa
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/lcssa" --opt-flag="disable-O0-optnone" --passes="simplifycfg loop-rotate lcssa" --inputs=1

# # inline
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/inline" --opt-flag="disable-O0-optnone" --passes="simplifycfg lcssa loop-rotate globalopt, adce, inline" --inputs=1

# # function-attrs
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/function-attrs" --opt-flag="disable-O0-optnone" --passes="function-attrs" --inputs=1

# # forceattrs
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/forceattrs" --opt-flag="disable-O0-optnone" --passes="forceattrs" --inputs=1

# # callsite-splitting
# "$BASE_DIR/Experiments/Ground_Truth/Scripts/run.sh" --exp-name="Opts/callsite-splitting" --opt-flag="disable-O0-optnone" --passes="callsite-splitting" --inputs=1



# Part 2: Get Hydra upper bound

# # simplifycfg
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/simplifycfg" --pre-passes="simplifycfg" --matching-threshold="25"

# # instcombine
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/instcombine" --pre-passes="instcombine" --matching-threshold="25"

# # early-cse-memssa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/early-cse-memssa" --pre-passes="early-cse-memssa" --matching-threshold="25"

# # gvn
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/gvn" --pre-passes="gvn" --matching-threshold="25"

# # sroa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/sroa" --pre-passes="sroa" --matching-threshold="25"

# # jump-threading
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/jump-threading" --pre-passes="jump-threading" --matching-threshold="25"

# # mem2reg
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/mem2reg" --pre-passes="mem2reg" --matching-threshold="25"

# # licm
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/licm" --pre-passes="simplifycfg lcssa loop-rotate licm" --matching-threshold="25"

# # loop-rotate
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-rotate" --pre-passes="simplifycfg lcssa loop-rotate" --matching-threshold="25"

# # indvars
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/indvars" --pre-passes="simplifycfg lcssa loop-rotate indvars" --matching-threshold="25"

# # correlated-propagation
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/correlated-propagation" --pre-passes="correlated-propagation" --matching-threshold="25"

# # mldst-motion
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/mldst-motion" --pre-passes="mldst-motion" --matching-threshold="25"

# # reassociate
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/reassociate" --pre-passes="reassociate" --matching-threshold="25"

# # slp-vectorizer
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/slp-vectorizer" --pre-passes="slp-vectorizer" --matching-threshold="25"

# # tailcallelim
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/tailcallelim" --pre-passes="tailcallelim" --matching-threshold="25"

# # dse
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/dse" --pre-passes="dse" --matching-threshold="25"

# # inferattrs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/inferattrs" --pre-passes="inferattrs" --matching-threshold="25"

# # speculative-execution
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/speculative-execution" --pre-passes="speculative-execution" --matching-threshold="25"

# # memcpyopt
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/memcpyopt" --pre-passes="memcpyopt" --matching-threshold="25"

# # instsimplify
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/instsimplify" --pre-passes="instsimplify" --matching-threshold="25"

# # ipsccp
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/ipsccp" --pre-passes="ipsccp" --matching-threshold="25"

# # adce
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/adce" --pre-passes="adce" --matching-threshold="25"

# # bdce
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/bdce" --pre-passes="bdce" --matching-threshold="25"

# # loop-unroll
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-unroll" --pre-passes="simplifycfg lcssa loop-rotate loop-unroll" --matching-threshold="25"

# # aggressive-instcombine
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/aggressive-instcombine" --pre-passes="aggressive-instcombine" --matching-threshold="25"

# # simple-loop-unswitch
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/simple-loop-unswitch" --pre-passes="simplifycfg lcssa loop-rotate simple-loop-unswitch" --matching-threshold="25"

# # globalopt
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/globalopt" --pre-passes="globalopt" --matching-threshold="25"

# # sccp
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/sccp" --pre-passes="sccp" --matching-threshold="25"

# # loop-deletion
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-deletion" --pre-passes="simplifycfg lcssa loop-rotate loop-deletion" --matching-threshold="25"

# # loop-idiom
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-idiom" --pre-passes="simplifycfg lcssa loop-rotate loop-idiom" --matching-threshold="25"

# # loop-sink
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-sink" --pre-passes="simplifycfg lcssa loop-rotate loop-sink" --matching-threshold="25"

# # loop-vectorize
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-vectorize" --pre-passes="simplifycfg lcssa loop-rotate loop-vectorize" --matching-threshold="25"

# # loop-load-elim
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-load-elim" --pre-passes="simplifycfg lcssa loop-rotate loop-load-elim" --matching-threshold="25"

# # div-rem-pairs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/div-rem-pairs" --pre-passes="div-rem-pairs" --matching-threshold="25"

# # loop-simplify
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/loop-simplify" --pre-passes="simplifycfg lcssa loop-rotate loop-simplify" --matching-threshold="25"

# # globals-aa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/globals-aa" --pre-passes="globals-aa" --matching-threshold="25"

# # strip-dead-prototypes
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/strip-dead-prototypes" --pre-passes="strip-dead-prototypes" --matching-threshold="25"

# # lower-constant-intrinsics
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/lower-constant-intrinsics" --pre-passes="lower-constant-intrinsics" --matching-threshold="25"

# # lcssa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/lcssa" --pre-passes="simplifycfg loop-rotate lcssa" --matching-threshold="25"

# # inline
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/inline" --pre-passes="simplifycfg lcssa loop-rotate globalopt adce inline" --matching-threshold="25"

# # function-attrs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/function-attrs" --pre-passes="function-attrs" --matching-threshold="25"

# # forceattrs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/forceattrs" --pre-passes="forceattrs" --matching-threshold="25"

# # callsite-splitting
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/Upper_Bound/callsite-splitting" --pre-passes="callsite-splitting" --matching-threshold="25"



# # # Part 3: Run Hydra on optimization flags

# # simplifycfg
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/simplifycfg" --new-passes="simplifycfg" --matching-threshold="25"

# # instcombine
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/instcombine" --new-passes="instcombine" --matching-threshold="25"

# # early-cse-memssa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/early-cse-memssa" --new-passes="early-cse-memssa" --matching-threshold="25"

# # gvn
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/gvn" --new-passes="gvn" --matching-threshold="25"

# # sroa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/sroa" --new-passes="sroa" --matching-threshold="25"

# # jump-threading
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/jump-threading" --new-passes="jump-threading" --matching-threshold="25"

# # mem2reg
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/mem2reg" --new-passes="mem2reg" --matching-threshold="25"

# # licm
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/licm" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="licm" --matching-threshold="25"

# # # loop-rotate
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-rotate" --pre-passes="simplifycfg lcssa" --new-passes="loop-rotate" --matching-threshold="25"

# # indvars
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/indvars" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="indvars" --matching-threshold="25"

# # correlated-propagation
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/correlated-propagation" --new-passes="correlated-propagation" --matching-threshold="25"

# # mldst-motion
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/mldst-motion" --new-passes="mldst-motion" --matching-threshold="25"

# # reassociate
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/reassociate" --new-passes="reassociate" --matching-threshold="25"

# # slp-vectorizer
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/slp-vectorizer" --new-passes="slp-vectorizer" --matching-threshold="25"

# # tailcallelim
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/tailcallelim" --new-passes="tailcallelim" --matching-threshold="25"

# # dse
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/dse" --new-passes="dse" --matching-threshold="25"

# # inferattrs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/inferattrs" --new-passes="inferattrs" --matching-threshold="25"

# # speculative-execution
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/speculative-execution" --new-passes="speculative-execution" --matching-threshold="25"

# # memcpyopt
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/memcpyopt" --new-passes="memcpyopt" --matching-threshold="25"

# # instsimplify
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/instsimplify" --new-passes="instsimplify" --matching-threshold="25"

# # ipsccp
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/ipsccp" --new-passes="ipsccp" --matching-threshold="25"

# # adce
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/adce" --new-passes="adce" --matching-threshold="25"

# # bdce
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/bdce" --new-passes="bdce" --matching-threshold="25"

# # loop-unroll
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-unroll" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-unroll" --matching-threshold="25"

# # aggressive-instcombine
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/aggressive-instcombine" --new-passes="aggressive-instcombine" --matching-threshold="25"

# # simple-loop-unswitch
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/simple-loop-unswitch" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="simple-loop-unswitch" --matching-threshold="25"

# # globalopt
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/globalopt" --new-passes="globalopt" --matching-threshold="25"

# # sccp
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/sccp" --new-passes="sccp" --matching-threshold="25"

# # loop-deletion
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-deletion" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-deletion" --matching-threshold="25"

# # loop-idiom
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-idiom" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-idiom" --matching-threshold="25"

# # loop-sink
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-sink" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-sink" --matching-threshold="25"

# # loop-vectorize
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-vectorize" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-vectorize" --matching-threshold="25"

# # loop-load-elim
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-load-elim" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-load-elim" --matching-threshold="25"

# # div-rem-pairs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/div-rem-pairs" --new-passes="div-rem-pairs" --matching-threshold="25"

# # loop-simplify
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/loop-simplify" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-simplify" --matching-threshold="25"

# # globals-aa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/globals-aa" --new-passes="globals-aa" --matching-threshold="25"

# # strip-dead-prototypes
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/strip-dead-prototypes" --new-passes="strip-dead-prototypes" --matching-threshold="25"

# # lower-constant-intrinsics
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/lower-constant-intrinsics" --new-passes="lower-constant-intrinsics" --matching-threshold="25"

# # lcssa
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/lcssa" --pre-passes="simplifycfg loop-rotate" --new-passes="lcssa" --matching-threshold="25"

# # inline
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/inline" --pre-passes="simplifycfg lcssa loop-rotate globalopt adce" --new-passes="inline" --matching-threshold="25"

# # function-attrs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/function-attrs" --new-passes="function-attrs" --matching-threshold="25"

# # forceattrs
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/forceattrs" --new-passes="forceattrs" --matching-threshold="25"

# # callsite-splitting
# "$BASE_DIR/Experiments/Profile_Projection/Scripts/run.sh" --exp-name="Opts/o0/callsite-splitting" --new-passes="callsite-splitting" --matching-threshold="25"

# # Part 4: run static prediction algorithms on optimization flags

# # simplifycfg
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/simplifycfg" --passes="simplifycfg"

# # instcombine
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/instcombine" --passes="instcombine"

# # early-cse-memssa
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/early-cse-memssa" --passes="early-cse-memssa"

# # gvn
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/gvn" --passes="gvn"

# # sroa
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/sroa" --passes="sroa"

# # jump-threading
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/jump-threading" --passes="jump-threading"

# # mem2reg
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/mem2reg" --passes="mem2reg"

# # licm
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/licm" --passes="simplifycfg lcssa loop-rotate licm"

# # # loop-rotate
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-rotate" --passes="simplifycfg lcssa loop-rotate"

# # indvars
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/indvars" --passes="simplifycfg lcssa loop-rotate indvars"

# # correlated-propagation
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/correlated-propagation" --passes="correlated-propagation"

# # mldst-motion
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/mldst-motion" --passes="mldst-motion"

# # reassociate
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/reassociate" --passes="reassociate"

# # slp-vectorizer
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/slp-vectorizer" --passes="slp-vectorizer"

# # tailcallelim
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/tailcallelim" --passes="tailcallelim"

# # dse
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/dse" --passes="dse"

# # inferattrs
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/inferattrs" --passes="inferattrs"

# # speculative-execution
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/speculative-execution" --passes="speculative-execution"

# # memcpyopt
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/memcpyopt" --passes="memcpyopt"

# # instsimplify
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/instsimplify" --passes="instsimplify"

# # ipsccp
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/ipsccp" --passes="ipsccp"

# # adce
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/adce" --passes="adce"

# # bdce
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/bdce" --passes="bdce"

# # loop-unroll
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-unroll" --passes="simplifycfg lcssa loop-rotate loop-unroll"

# # aggressive-instcombine
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/aggressive-instcombine" --passes="aggressive-instcombine"

# # simple-loop-unswitch
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/simple-loop-unswitch" --passes="simplifycfg lcssa loop-rotate simple-loop-unswitch"

# # globalopt
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/globalopt" --passes="globalopt"

# # sccp
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/sccp" --passes="sccp"

# # loop-deletion
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-deletion" --passes="simplifycfg lcssa loop-rotate loop-deletion"

# # loop-idiom
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-idiom" --passes="simplifycfg lcssa loop-rotate loop-idiom"

# # loop-sink
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-sink" --passes="simplifycfg lcssa loop-rotate loop-sink"

# # loop-vectorize
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-vectorize" --passes="simplifycfg lcssa loop-rotate loop-vectorize"

# # loop-load-elim
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-load-elim" --passes="simplifycfg lcssa loop-rotate loop-load-elim"

# # div-rem-pairs
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/div-rem-pairs" --passes="div-rem-pairs"

# # loop-simplify
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/loop-simplify" --passes="simplifycfg lcssa loop-rotate loop-simplify"

# # globals-aa
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/globals-aa" --passes="globals-aa"

# # strip-dead-prototypes
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/strip-dead-prototypes" --passes="strip-dead-prototypes"

# # lower-constant-intrinsics
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/lower-constant-intrinsics" --passes="lower-constant-intrinsics"

# # lcssa
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/lcssa" --passes="simplifycfg loop-rotate lcssa"

# # inline
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/inline" --passes="simplifycfg lcssa loop-rotate globalopt adce inline"

# # function-attrs
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/function-attrs" --passes="function-attrs"

# # forceattrs
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/forceattrs" --passes="forceattrs"

# # callsite-splitting
# "$BASE_DIR/Experiments/Profile_Prediction/Scripts/run.sh" --exp-name="Opts/o0/callsite-splitting" --passes="callsite-splitting"

# "$BASE_DIR/Experiments/Scripts/gen_csvs.sh"
