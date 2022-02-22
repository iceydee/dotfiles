#!/bin/bash

LLVM_VERSION="13.0.1"
CMAKE_VERSION="3.22.2"

cd "${HOME}/src"

git clone --branch "v${CMAKE_VERSION}" --depth 1 https://github.com/Kitware/CMake CMake
pushd CMake
./bootstrap && make && sudo make install
popd

git clone --branch "llvmorg-${LLVM_VERSION}" --depth 1 https://github.com/llvm/llvm-project llvm-project
pushd llvm-project
mkdir build ; cd build
cmake -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" -G "Unix Makefiles" ../llvm
make && sudo make install
popd

./clang/set_clang.sh
