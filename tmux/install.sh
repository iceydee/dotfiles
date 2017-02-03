#!/bin/bash

mkdir -p ~/src/github.com/gpakosz/.tmux
git clone git@github.com:gpakosz/.tmux ~/src/github.com/gpakosz/.tmux
ln -sf ~/src/github.com/gpakosz/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/my/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local
