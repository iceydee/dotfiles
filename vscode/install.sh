#!/bin/bash

if [ -f "/etc/issue" ]; then
  if [ -n "$(cat /etc/issue | grep "Ubuntu")" ]; then
    sudo apt install -y shellcheck
  fi
fi

if [ -n "$(uname -r | grep "Microsoft")" ]; then
  CODE_PATH=/mnt/c/Users/${USER}/AppData/Roaming/Code/User
  elif [ -n "$(uname -s | grep "Darwin")" ]; then
  CODE_PATH=~/Library/Application\ Support/Code/User
else
  CODE_PATH=~/.config/Code/User
fi

mkdir -p ${CODE_PATH}
ln -sf ~/my/dotfiles/vscode/settings.json ${CODE_PATH}/settings.json

CODE=$(which code)
if [ -n "${CODE}" ]; then
  EXT="${HOME}/my/dotfiles/vscode/extensions"
  A=0
  LINES=$(wc -l ${EXT} | awk '{print $1}')
  while [ "${A}" -lt "${LINES}" ]; do
    let "A+=1"
    code --install-extension $(head -n${A} ${EXT} | tail -n1)
  done
fi

