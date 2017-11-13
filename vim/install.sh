#!/bin/bash

ln -sf ~/my/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone git@github.com:gmarik/vundle ~/.vim/bundle/vundle
