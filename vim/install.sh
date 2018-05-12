#!/bin/bash

if [ -f "/etc/issue" ]; then
  if [ -n "$(cat /etc/issue | grep "Ubuntu")" ]; then
    sudo apt install -y vim
  fi
fi

ln -sf ~/my/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
