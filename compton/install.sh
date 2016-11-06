#!/bin/bash

./package compton
mkdir -p ~/.config/compton
ln -sf ${HOME}/my/dotfiles/compton/compton.conf ${HOME}/.config/compton/compton.conf
