#!/bin/bash

ln -sf ~/my/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
g clone gmarik/vundle ~/.vim/bundle/vundle
