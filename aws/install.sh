#!/bin/bash

# Terraform
if [ -z "$(which terraform | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/
fi

# AWS cli
if [ -z "$(which aws | grep -v "not found")" ]; then
  pip3 install awscli
fi
if [ ! -f "${HOME}/.aws/config" ]; then
  mkdir -p ${HOME}/.aws
  ln -sf ${HOME}/my/dotfiles/aws/config ${HOME}/.aws/config
fi

# AWS Vault
if [ -z "$(which aws-vault | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -L -o aws-vault https://github.com/99designs/aws-vault/releases/download/v4.7.1/aws-vault-linux-amd64
    chmod +x aws-vault
    sudo mv aws-vault /usr/local/bin/
  fi
fi

# AWS IAM Authenticator
if [ -z "$(which aws-iam-authenticator | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
    chmod +x aws-iam-authenticator
    sudo mv aws-iam-authenticator /usr/local/bin/
  fi
fi

# Kubectl
if [ -z "$(which kubectl | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    sudo snap install kubectl --classic
  fi
fi

# Helm
if [ -z "$(which helm | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o helm.tar.gz https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz
    tar zxvf helm.tar.gz
    rm -f helm.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin/
    sudo mv linux-amd64/tiller /usr/local/bin/
    sudo rm -rf linux-amd64/
  fi
fi
