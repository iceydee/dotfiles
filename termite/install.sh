#!/bin/bash

cd ./termite

gunzip -c termite.gz > termite
gunzip -c xterm-termite.gz > xterm-termite

chmod +x termite
chmod +x xterm-termite

sudo mkdir -p /usr/local/share/terminfo/x
sudo mv termite /usr/local/bin/
sudo mv xterm-termite /usr/local/share/terminfo/x/

pushd /usr/local/lib
sudo tar zxvf /home/mio/my/dotfiles/termite/vte.tar.gz
sudo ln -sf libvte-2.91.so.0.4800.2 libvte-2.91.so.0
sudo ln -sf libvte-2.91.so.0 libvte-2.91.so
popd

sudo cp /usr/local/lib/libvte-2.91.a /usr/local/lib/libvte-2.91.la \
/usr/local/lib/libvte-2.91.so.0.4800.2 /usr/lib
pushd /usr/lib
sudo ln -sf libvte-2.91.so.0.4800.2 libvte-2.91.so.0
sudo ln -sf libvte-2.91.so.0 libvte-2.91.so
popd
sudo mkdir -p /lib/terminfo/x; sudo ln -sf \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite

sudo ldconfig

mkdir -p ~/.config/termite
ln -sf ~/my/dotfiles/termite/config ~/.config/termite/config
