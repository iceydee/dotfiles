#!/bin/bash

yay -S rofi papirus-icon-theme
mkdir -p ~/.config/rofi
ln -sf ${HOME}/my/dotfiles/rofi/config.rasi ${HOME}/.config/rofi/config.rasi
