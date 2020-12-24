#!/bin/bash

sudo apt -y install libx11-dev libxinerama-dev libxft-dev

# Build dmenu2
mkdir -p ~/src/github.com/nwenger
cd ~/src/github.com/nwenger
git clone git@github.com:nwenger/dmenu2.git
cd dmenu2
make
sudo make install
make clean

# Install our launcher script
sudo ln -sf ~/my/dotfiles/dmenu2/launcher /usr/local/bin/launcher
