#!/bin/bash

cd ./polybar

gunzip -c polybar.gz > polybar
chmod +x polybar
sudo mv polybar /usr/local/bin/

mkdir -p ~/.config/polybar
ln -sf ~/my/dotfiles/polybar/config ~/.config/polybar/config
