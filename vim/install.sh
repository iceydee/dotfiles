#!/bin/bash

sudo apt install -y vim

ln -sf ~/my/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
