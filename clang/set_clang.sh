#!/bin/bash

./clang/unset_clang.sh
sudo update-alternatives --install /usr/bin/c++ c++ /usr/local/bin/clang++ 100
sudo update-alternatives --install /usr/bin/cc cc /usr/local/bin/clang 100
