#!/bin/bash

# KOPS
if [ -z "$(which kops | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
    chmod +x kops-linux-amd64
    sudo mv kops-linux-amd64 /usr/local/bin/kops
  fi
fi
