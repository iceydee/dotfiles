#!/bin/bash

./clang/unset_clang.sh
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-12 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-12 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/lld lld /usr/bin/lld-12 100
sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-12 100
sudo update-alternatives --install /usr/bin/lldb-mi lldb-mi /usr/bin/lldb-mi-12 100
