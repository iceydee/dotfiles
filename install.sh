#!/bin/bash

echo "Which config?"
echo
echo "1) 3x monitor desktop"
echo "2) laptop"
echo
echo -n "? "
read A

if [ "${A}" -eq "2" ]; then
  echo "laptop" > ~/.computer-config
else
  echo "desktop" > ~/.computer-config
fi

clear

ln -sf ~/my/dotfiles/zsh/.zshrc ~/.zshrc
for FILE in `find ~/my/dotfiles/zsh/custom -type f`; do
  ln -sf ${FILE} ~/.oh-my-zsh/custom/`basename ${FILE}`
done

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

# Setup vim
./vim/install.sh

# Setup tmux
./tmux/install.sh

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

# Install task warrior
./task/install.sh
