#!/bin/bash

sudo apt install git-lfs

mkdir -p ~/src
cd ~/src
git clone https://github.com/github/hub.git
cd hub
mkdir -p ~/go/src
go get github.com/github/hub
make
make man-pages
sudo make install

git config --global user.email "mio@plingot.com"
git config --global user.name "Mio Nilsson"
git config --global user.signingkey "3F6F72864F247293"
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd "code --wait \$MERGED"
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
git config --global commit.gpgSign "true"
git config --global hub.protocol "ssh"
