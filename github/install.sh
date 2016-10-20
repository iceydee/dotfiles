#!/bin/bash

mkdir -p ~/src
cd ~/src
git clone https://github.com/github/hub.git
cd hub
make
make man-pages
sudo make install
