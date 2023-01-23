#!/bin/bash

sudo apt install -y \
cmake \
clang-14 \
clang-format-14 \
lldb-14 \
lld-14 \
libc++-14-dev \
libc++abi-14-dev

./clang/set_clang.sh
