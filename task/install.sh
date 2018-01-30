#!/bin/bash

# Check we're on ubuntu first
if [ -z "$(which apk)" ]; then
  sudo apt-get -y install taskwarrior jq
fi

mkdir -p "${HOME}/.tasklists"
ln -sf ${HOME}/my/dotfiles/task/.taskrc ${HOME}/.taskrc
ln -sf ${HOME}/my/dotfiles/task/task.theme ${HOME}/.task.theme
sudo ln -sf ${HOME}/my/dotfiles/task/tl /usr/local/bin/tl
sudo ln -sf ${HOME}/my/dotfiles/task/tf /usr/local/bin/tf
sudo ln -sf ${HOME}/my/dotfiles/task/f /usr/local/bin/f
sudo ln -sf ${HOME}/my/dotfiles/task/taskswitch /usr/local/bin/taskswitch
