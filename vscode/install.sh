#!/bin/bash

if [ -z "$(uname -s | grep "Darwin")" ]; then
  mkdir -p ~/.config/Code/User
  ln -sf ~/my/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
else
  mkdir -p ~/Library/Application\ Support/Code/User
  ln -sf ~/my/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi

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

