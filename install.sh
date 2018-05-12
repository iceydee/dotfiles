#!/bin/bash

FIRST_RUN=0

if [ ! -f "${HOME}/.compton-config" ]; then
  FIRST_RUN=1

  echo "Which config?"
  echo
  echo "1) Compton (screen bling - requires GPU)"
  echo "2) Non-compton (for VMs etc, where GPU is missing)"
  echo
  echo -n "? "
  read A

  if [ "${A}" -eq "2" ]; then
    echo "no" > ~/.compton-config
  else
    echo "yes" > ~/.compton-config
  fi
fi

# Update the polybar monitor config
xrandr --query | grep "\bconnected\b" | awk '{print $1}' > ~/.polybar-monitor

# Update resolution for dmenu
xrandr --query | grep "\bconnected\b" | head -n1 | awk '{print $3}' | cut -d'+' -f1 > ~/.dmenu-resolution

clear

# Install wallpaper
./Wallpapers/install.sh

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

# Install clang
./clang/install.sh

# Install chrome
./chrome/install.sh

# Install docker
./docker/install.sh

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
