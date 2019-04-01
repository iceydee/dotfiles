#!/bin/bash

sudo apt install -y clang-7 clang-format-7 lldb-7

sudo update-alternatives --remove-all clang++
sudo update-alternatives --remove-all clang
sudo update-alternatives --remove-all clang-format
sudo update-alternatives --remove-all c++
sudo update-alternatives --remove-all cc
sudo update-alternatives --remove-all lldb
sudo update-alternatives --remove-all lldb-mi
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-7 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-7 100
sudo update-alternatives --install /usr/bin/lldb-mi lldb-mi /usr/bin/lldb-mi-7 100
