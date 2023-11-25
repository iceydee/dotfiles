#!/bin/bash

# Packer
if [ -z "$(which packer | grep -v "not found")" ]; then
  curl -o packer.zip https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_linux_amd64.zip
  
  unzip packer.zip
  rm -f packer.zip
  sudo mv packer /usr/local/bin/packer
fi
