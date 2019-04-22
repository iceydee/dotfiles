#!/bin/bash

sudo apt install -y clang-8 clang-format-8 lldb-8 lld-8

sudo update-alternatives --remove-all clang++
sudo update-alternatives --remove-all clang
sudo update-alternatives --remove-all clang-format
sudo update-alternatives --remove-all c++
sudo update-alternatives --remove-all cc
sudo update-alternatives --remove-all lld
sudo update-alternatives --remove-all lldb
sudo update-alternatives --remove-all lldb-mi
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-8 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-8 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-8 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/lld lld /usr/bin/lld-8 100
sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-8 100
sudo update-alternatives --install /usr/bin/lldb-mi lldb-mi /usr/bin/lldb-mi-8 100
