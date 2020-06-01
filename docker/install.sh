#!/bin/bash

if [ ! -f "/etc/issue" ]; then
  echo "warning: not installing docker - not on ubuntu"
  exit 1
fi

if [ -z "$(cat /etc/issue | grep "Ubuntu")" ]; then
  echo "warning: not installing docker - not on ubuntu"
  exit 1
fi

sudo apt install -y \
apt-transport-https \
ca-certificates \
curl \
software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt install -y docker-ce

sudo groupadd docker

sudo usermod -aG docker $USER

sudo systemctl enable docker

sudo curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
