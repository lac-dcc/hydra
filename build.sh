#!/bin/bash

# Set the following variables in a .env file (only if needed, not advised):
# - LLVM_INSTALL_DIR: path to the llvm install directory (empty if it's on the PATH)
# - LLVM_OPT: path to the opt binary
# - CLANG: path to the clang binary
# source .env

LLVM_INSTALL_DIR="~/clang/install"

echo "--------------------------------------------------------------------------------"
if [ ! -e "build" ]
then
    echo "Creating build directory"
    mkdir -p build
    echo "--------------------------------------------------------------------------------"

    echo "Building the CFG printer pass"
    cd build
    cmake -DLLVM_INSTALL_DIR=$LLVM_INSTALL_DIR -G "Unix Makefiles" ..
    cmake --build .
    cd ..

    echo "--------------------------------------------------------------------------------"
    echo "Done"
    echo "--------------------------------------------------------------------------------"
else
    echo "Build directory already exists"
    echo "--------------------------------------------------------------------------------"

    echo "Updating the CFG printer pass"
    cd build
    cmake --build .
    cd ..

    echo "--------------------------------------------------------------------------------"
    echo "Done"
    echo "--------------------------------------------------------------------------------"
fi