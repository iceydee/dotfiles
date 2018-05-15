#!/bin/bash

sudo apt install -y clang-6.0 clang-format lldb-6.0

sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-6.0 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-6.0 100
sudo update-alternatives --install /usr/bin/lldb-mi lldb-mi /usr/bin/lldb-mi-6.0 100
