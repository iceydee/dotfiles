#!/bin/bash

yay -S dunst ttf-inter papirus-icon-theme
mkdir -p ~/.config/dunst
ln -sf ${HOME}/my/dotfiles/dunst/dunstrc ${HOME}/.config/dunst/dunstrc
