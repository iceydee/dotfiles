#!/bin/bash

# Subset for docker dev container

# Remove the rvm prompt
mv ~/my/dotfiles/zsh/custom/zsh-config.zsh /tmp/zsh-config-old.zsh
tail -n+3 /tmp/zsh-config-old.zsh > ~/my/dotfiles/zsh/custom/zsh-config.zsh

# Install zsh
./zsh/install.sh

# Install dircolors
git clone https://github.com/seebi/dircolors-solarized.git ~/.solarized

# Install powerline fonts
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Setup tmux
./tmux/install.sh

# Setup vim
./vim/install.sh
