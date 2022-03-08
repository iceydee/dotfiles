#!/bin/bash

TERRAFORM="v1.1.6"
AWS_VAULT="v6.5.0"
AWS_IAM_AUTHENTICATOR="v0.5.0"
KOPS="1.23.0"
HELM="v3.8.0"
SOPS="3.7.1"

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
  versionCheck terraform11x "terraform version" "${TERRAFORM}"
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
