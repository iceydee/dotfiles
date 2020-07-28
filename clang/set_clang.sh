#!/bin/bash

./clang/unset_clang.sh
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/lld lld /usr/bin/lld-10 100
sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-10 100
sudo update-alternatives --install /usr/bin/lldb-mi lldb-mi /usr/bin/lldb-mi-10 100
