#!/bin/bash

FIRST_RUN=0

if [ ! -f "~/.computer-config" ]; then
  FIRST_RUN=1

  echo "Which config?"
  echo
  echo "1) 3x monitor desktop"
  echo "2) laptop"
  echo "3) vm"
  echo
  echo -n "? "
  read A

  if [ "${A}" -eq "2" ]; then
    echo "laptop" > ~/.computer-config
  elif [ "${A}" -eq "3" ]; then
    echo "vm" > ~/.computer-config
  else
    echo "desktop" > ~/.computer-config
  fi
fi

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

# Install Compton
./compton/install.sh

# Install bspwm
./bspwm/install.sh

# Install polybar
./polybar/install.sh

# Install termite
./termite/install.sh

# Install dmenu2
./dmenu2/install.sh

# Install hub command
./github/install.sh

# Setup vim
./vim/install.sh

# Setup vscode
./vscode/install.sh

# Install task warrior
./task/install.sh
