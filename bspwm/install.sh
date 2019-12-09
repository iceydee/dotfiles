#!/bin/bash

sudo apt install -y bspwm

# Setup bspwm
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
ln -sf ~/my/dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ~/my/dotfiles/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ~/my/dotfiles/bspwm/startup ~/.config/bspwm/startup
ln -sf ~/my/dotfiles/bspwm/task_panel ~/.config/bspwm/task_panel
sudo ln -sf ~/my/dotfiles/bspwm/focus /usr/local/bin/focus
sudo cp ~/my/dotfiles/bspwm/bspwm.desktop /usr/share/xsessions/
sudo ln -sf ~/my/dotfiles/bspwm/.desktop /usr/local/bin/.desktop
