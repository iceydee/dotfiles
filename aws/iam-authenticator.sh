#!/bin/bash

# AWS IAM Authenticator
if [ -z "$(which aws-iam-authenticator | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -Lo aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.11/aws-iam-authenticator_0.6.11_linux_amd64
    chmod +x aws-iam-authenticator
    sudo mv aws-iam-authenticator /usr/local/bin/
  fi
fi
