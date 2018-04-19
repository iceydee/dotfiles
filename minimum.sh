#!/bin/bash

FIRST_RUN=0

clear

# Install zsh
./zsh/install.sh

# Install dircolors
git clone https://github.com/seebi/dircolors-solarized.git ~/.solarized

# Install powerline fonts
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Setup tmux
./tmux/install.sh

# From this point onwards - we need to have new env running
if [ "${FIRST_RUN}" -eq 1 ]; then
  echo "Configuration prepared. Please open new terminal window so new environment is loaded."
  echo
  echo "${0}"
  echo

  exit 0
fi

# Install hub command
./github/install.sh

# Setup vim
./vim/install.sh

# Setup vscode
./vscode/install.sh

# Install task warrior
./task/install.sh
