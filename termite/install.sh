#!/bin/bash

./package g++ \
	  libgtk-3-dev \
	  gtk-doc-tools \
	  gnutls-bin \
	  valac \
	  libglib3.0-cil-dev \
	  libgnutls28-dev \
	  libgirepository1.0-dev \
	  libxml2-utils \
	  gperf

mkdir -p ~/src/github.com/thestinger
cd ~/src/github.com/thestinger

git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install

mkdir -p ~/.config/termite
ln -sf ~/my/dotfiles/termite/config ~/.config/termite/config
