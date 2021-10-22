#!/bin/bash

sudo apt install -y \
cmake \
clang-12 \
clang-format-12 \
lldb-12 \
lld-12 \
libc++-12-dev \
libc++abi-12-dev

./clang/set_clang.sh
