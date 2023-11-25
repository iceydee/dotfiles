#!/bin/bash

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
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform11x
fi

# Terraform 1.6.x
if [ -z "$(which terraform16x | grep -v "not found")" ]; then
  if [ "$(uname -s)" = "Linux" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_linux_amd64.zip
    elif [ "$(uname -s)" = "Darwin" ]; then
    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_darwin_amd64.zip
  fi
  
  unzip terraform.zip
  rm -f terraform.zip
  sudo mv terraform /usr/local/bin/terraform16x
fi

sudo rm -f /usr/local/bin/terraform
sudo ln -sf /usr/local/bin/terraform16x /usr/local/bin/terraform
