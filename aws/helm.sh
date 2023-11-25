#!/bin/bash

# Helm
if [ -z "$(which helm | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o helm.tar.gz https://get.helm.sh/helm-v3.13.2-linux-amd64.tar.gz
    tar zxvf helm.tar.gz
    rm -f helm.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin/helm
    sudo rm -rf linux-amd64/
  fi
fi
