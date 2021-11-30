#!/bin/bash

TERRAFORM="v1.0.10"
AWS_VAULT="v6.3.1"
AWS_IAM_AUTHENTICATOR="v0.5.0"
KOPS="1.22.2"
HELM="v3.7.1"
SOPS="3.6.1"

function checkInstalled {
  local CMD
  CMD="${1}"
  if [ -n "$(which "${CMD}" | grep -v "not found")" ]; then
    return 0
  fi
  return 1
}

function versionCheck {
  local CMD="${1}"
  local VERSION_CMD="${2}"
  local VERSION="${3}"
  
  if [ -z "$(eval "${VERSION_CMD} 2>&1" | head -n1 | grep "${VERSION}")" ]; then
    echo "Removing ${CMD}"
    sudo rm -f "$(which "${CMD}")"
  fi
}

checkInstalled terraform && {
  versionCheck terraform1x "terraform version" "${TERRAFORM}"
}

checkInstalled aws-vault && {
  versionCheck aws-vault "aws-vault --version" "${AWS_VAULT}"
}

checkInstalled aws-iam-authenticator && {
  versionCheck aws-iam-authenticator "aws-iam-authenticator version" "${AWS_IAM_AUTHENTICATOR}"
}

checkInstalled kops && {
  versionCheck kops "kops version" "${KOPS}"
}

checkInstalled helm && {
  versionCheck helm "helm version" "${HELM}"
}

checkInstalled sops && {
  versionCheck sops "sops --version" "${SOPS}"
}
