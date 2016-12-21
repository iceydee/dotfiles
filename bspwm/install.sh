#!/bin/bash

sudo apt-get install -y git \
                        xcb \
                        libxcb-util0-dev \
                        libxcb-ewmh-dev \
                        libxcb-randr0-dev \
                        libxcb-icccm4-dev \
                        libxcb-keysyms1-dev \
                        libxcb-xinerama0-dev \
                        libasound2-dev \
                        gcc \
                        make \
                        libxcb-xtest0-dev \
                        libxft-dev \
                        libx11-xcb-dev \
			acpi \
			jq \
			xwrits \
			numlockx

mkdir -p ~/src/github.com/{defektive,baskerville,krypt-n}
cd  ~/src/github.com/baskerville
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
git clone https://github.com/baskerville/sutils.git
git clone https://github.com/baskerville/xtitle.git
git clone https://github.com/baskerville/xdo.git

cd  ~/src/github.com/baskerville
cd bspwm/ && make && sudo make install
cd ../sxhkd/ && make && sudo make install
cd ../sutils/ && make && sudo make install
cd ../xtitle/ && make && sudo make install
cd ../xdo/ && make && sudo make install

# patched lemonbar
cd ~/src/github.com/krypt-n
cd !:1
git clone https://github.com/krypt-n/bar.git
cd bar && make && sudo make install

echo
echo
echo

# Setup bspwm
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
ln -sf ~/my/dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ~/my/dotfiles/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ~/my/dotfiles/bspwm/panel ~/.config/bspwm/panel
ln -sf ~/my/dotfiles/bspwm/panel_bar ~/.config/bspwm/panel_bar
ln -sf ~/my/dotfiles/bspwm/panel_colors ~/.config/bspwm/panel_colors
ln -sf ~/my/dotfiles/bspwm/startup ~/.config/bspwm/startup
ln -sf ~/my/dotfiles/bspwm/task_panel ~/.config/bspwm/task_panel
sudo ln -sf ~/my/dotfiles/bspwm/focus /usr/local/bin/focus
sudo cp ~/my/dotfiles/bspwm/bspwm.desktop /usr/share/xsessions/
