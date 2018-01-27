#!/bin/bash

if [ -z "$(uname -s | grep "Darwin")" ]; then
  mkdir -p ~/.config/Code/User
  ln -sf ~/my/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
else
  mkdir -p ~/Library/Application\ Support/Code/User
  ln -sf ~/my/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi
