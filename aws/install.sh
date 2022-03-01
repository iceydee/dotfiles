#!/bin/bash

./aws/version_cleanup.sh

if [ -f "/etc/issue" ]; then
  if [ -n "$(cat /etc/issue | grep "Ubuntu")" ]; then
    sudo apt install -y python3-pip
  fi
fi

# Terraform 0.12
if [ -z "$(which terraform12 | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform12
fi

# Terraform 0.13
if [ -z "$(which terraform13 | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform13
fi

# Terraform 0.14
if [ -z "$(which terraform14 | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform14
fi

# Terraform 1.x
if [ -z "$(which terraform1x | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform1x
fi

# Terraform 1.1.x
if [ -z "$(which terraform11x | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip
  elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_darwin_amd64.zip
  fi

  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform11x
fi

sudo rm -f /usr/local/bin/terraform
sudo ln -sf /usr/local/bin/terraform11x /usr/local/bin/terraform

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
    curl -L -o aws-vault https://github.com/99designs/aws-vault/releases/download/v6.3.1/aws-vault-linux-amd64
    chmod +x aws-vault
    sudo mv aws-vault /usr/local/bin/
  fi
fi

# AWS IAM Authenticator
if [ -z "$(which aws-iam-authenticator | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator
    chmod +x aws-iam-authenticator
    sudo mv aws-iam-authenticator /usr/local/bin/
  fi
fi

# KOPS
if [ -z "$(which kops | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
    chmod +x kops-linux-amd64
    sudo mv kops-linux-amd64 /usr/local/bin/kops
  fi
fi

# Kubectl
if [ -z "$(which kubectl | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    sudo snap install kubectl --classic
  fi
fi

# Helm
if [ -z "$(which helm2 | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o helm.tar.gz https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz
    tar zxvf helm.tar.gz
    rm -f helm.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin/helm2
    sudo mv linux-amd64/tiller /usr/local/bin/
    sudo rm -rf linux-amd64/
  fi
fi
if [ -z "$(which helm3 | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o helm.tar.gz https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz
    tar zxvf helm.tar.gz
    rm -f helm.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin/helm3
    sudo rm -rf linux-amd64/
    sudo ln -sf /usr/local/bin/helm3 /usr/local/bin/helm
  fi
fi

sudo rm -f /usr/local/bin/helm
sudo ln -sf /usr/local/bin/helm3 /usr/local/bin/helm

# AZ Cli
if [ -z "$(which az | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  fi
fi

# SOPS
if [ -z "$(which sops | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -L -o sops https://github.com/mozilla/sops/releases/download/v3.6.1/sops-v3.6.1.linux
    chmod +x sops
    sudo mv sops /usr/local/bin/
  fi
fi
