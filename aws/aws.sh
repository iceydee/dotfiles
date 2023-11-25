#!/bin/bash

# AWS cli
if [ -z "$(which aws | grep -v "not found")" ]; then
  yay -S aws-cli-v2
fi
if [ ! -f "${HOME}/.aws/config" ]; then
  mkdir -p ${HOME}/.aws
  ln -sf ${HOME}/my/dotfiles/aws/config ${HOME}/.aws/config
fi
