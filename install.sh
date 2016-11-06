#!/bin/bash

./package wget

ln -sf ~/my/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/my/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/my/dotfiles/tmux/.tmux.conf ~/.tmux.conf
for FILE in `find ~/my/dotfiles/zsh/custom -type f`; do
  ln -sf ${FILE} ~/.oh-my-zsh/custom/`basename ${FILE}`
done

# Install powerline fonts
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Install Compton
./compton/install.sh

# Install bspwm
./bspwm/install.sh

# Install termite
./termite/install.sh

# Install dmenu2
./dmenu2/install.sh

# Install hub command
./github/install.sh
