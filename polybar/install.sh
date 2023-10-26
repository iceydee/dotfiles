#!/bin/bash

mkdir -p ~/src
cd ~/src
git clone -b v2.0.0 git@github.com:MarcDonald/polybar-mic-volume
mkdir -p "${HOME}"/.local/bin
ln -sf "${HOME}"/src/polybar-mic-volume/mic-volume/mic-volume.sh "${HOME}"/.local/bin/mic-volume.sh

mkdir -p ~/.config/polybar
ln -sf ~/my/dotfiles/polybar/config ~/.config/polybar/config
