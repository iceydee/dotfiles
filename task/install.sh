#!/bin/bash

# Check we're on ubuntu first
if [ -z "$(which apk)" ]; then
  sudo apt -y install taskwarrior jq
fi

mkdir -p "${HOME}/.tasklists"
ln -sf ${HOME}/my/dotfiles/task/.taskrc-plingot ${HOME}/.taskrc
ln -sf ${HOME}/my/dotfiles/task/task.theme ${HOME}/.task.theme
ln -sf ${HOME}/my/dotfiles/task/on-modify ${HOME}/Dropbox/PlingotTask/hooks/on-modify

# We're already root in docker
SUDO="sudo"
if [ "${UID}" -eq 0 ]; then
  SUDO=""
fi

${SUDO} ln -sf ${HOME}/my/dotfiles/task/tl /usr/local/bin/tl
${SUDO} ln -sf ${HOME}/my/dotfiles/task/tf /usr/local/bin/tf
${SUDO} ln -sf ${HOME}/my/dotfiles/task/f /usr/local/bin/f
${SUDO} ln -sf ${HOME}/my/dotfiles/task/taskswitch /usr/local/bin/taskswitch
${SUDO} ln -sf ${HOME}/my/dotfiles/task/pull-tasks /usr/local/bin/pull-tasks
