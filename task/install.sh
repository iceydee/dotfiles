#!/bin/bash

sudo apt-get -y install taskwarrior

ln -sf ${HOME}/my/dotfiles/task/.taskrc ${HOME}/.taskrc
ln -sf ${HOME}/my/dotfiles/task/task.theme ${HOME}/.task.theme
sudo ln -sf ${HOME}/my/dotfiles/task/tf /usr/local/bin/tf
sudo ln -sf ${HOME}/my/dotfiles/task/f /usr/local/bin/f
sudo ln -sf ${HOME}/my/dotfiles/task/taskswitch /usr/local/bin/taskswitch
