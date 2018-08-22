#!/bin/bash

mkdir -p ~/src
cd ~/src
git clone https://github.com/github/hub.git
cd hub
make
make man-pages
sudo make install

git config --global user.email "iceydee@users.noreply.github.com"
git config --global user.name "Mio Nilsson"
