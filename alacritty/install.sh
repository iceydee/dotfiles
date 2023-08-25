#!/bin/bash

yay -S alacritty

mkdir -p ~/.config/alacritty
ln -sf ~/my/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
