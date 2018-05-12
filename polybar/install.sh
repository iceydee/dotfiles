#!/bin/bash

sudo apt -y install cmake \
cmake-data \
libfontconfig1-dev \
libfreetype6-dev \
libghc-x11-xft-dev \
libx11-xcb-dev \
libxcb1-dev \
libxcb-ewmh-dev \
libxcb-icccm4-dev \
libxcb-image0-dev \
libxcb-randr0-dev \
libxcb-util0-dev \
libxcb-xkb-dev \
pkg-config \
python-xcbgen \
xcb-proto \
libasound2-dev \
libmpdclient-dev \
libiw-dev

mkdir -p ~/src/github.com/jaagr
cd  ~/src/github.com/jaagr
git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
mkdir -p polybar/build
cd polybar/build
cmake -DCMAKE_BUILD_TYPE=Release ..
sudo make install

mkdir -p ~/.config/polybar
ln -sf ~/my/dotfiles/polybar/config ~/.config/polybar/config
