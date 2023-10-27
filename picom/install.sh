#!/bin/bash

yay -S picom
mkdir -p ~/.config/picom
ln -sf ${HOME}/my/dotfiles/picom/picom.conf ${HOME}/.config/picom/picom.conf
