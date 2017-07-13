#!/bin/bash

mkdir -p ~/src/github.com/thestinger
cd ~/src/github.com/thestinger

git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
sudo apt-get install g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool
sudo apt-get install libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev
sudo apt-get install libxml2-utils gperf libpcre2-dev
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && git checkout 0.48.2-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install

sudo cp /usr/local/lib/libvte-2.91.a /usr/local/lib/libvte-2.91.la \
/usr/local/lib/libvte-2.91.so /usr/local/lib/libvte-2.91.so.0 \
/usr/local/lib/libvte-2.91.so.0.4800.2 /usr/lib
sudo mkdir -p /lib/terminfo/x; sudo ln -sf \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite

sudo ldconfig

mkdir -p ~/.config/termite
ln -sf ~/my/dotfiles/termite/config ~/.config/termite/config
