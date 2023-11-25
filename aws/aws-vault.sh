#!/bin/bash

# AWS Vault
if [ -z "$(which aws-vault | grep -v "not found")" ]; then
  curl -L -o aws-vault https://github.com/99designs/aws-vault/releases/download/v7.2.0/aws-vault-linux-amd64
  chmod +x aws-vault
  sudo mv aws-vault /usr/local/bin/
fi
