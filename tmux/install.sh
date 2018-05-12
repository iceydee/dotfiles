#!/bin/bash

if [ -f "/etc/issue" ]; then
  if [ -n "$(cat /etc/issue | grep "Ubuntu")" ]; then
    sudo apt install -y tmux
  fi
fi

mkdir -p ~/src/github.com/gpakosz/.tmux
git clone https://github.com/gpakosz/.tmux ~/src/github.com/gpakosz/.tmux
ln -sf ~/src/github.com/gpakosz/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/my/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local
