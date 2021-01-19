#!/bin/bash

sudo apt install -y \
cmake \
clang-11 \
clang-format-11 \
lldb-11 \
lld-11 \
libc++-11-dev \
libc++abi-11-dev

./clang/set_clang.sh
