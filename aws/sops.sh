#!/bin/bash

# SOPS
if [ -z "$(which sops | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -L -o sops https://github.com/getsops/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64
    chmod +x sops
    sudo mv sops /usr/local/bin/
  fi
fi
