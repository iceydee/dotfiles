#!/bin/bash

./aws/version_cleanup.sh

./aws/terraform.sh
./aws/aws.sh
./aws/aws-vault.sh
./aws/iam-authenticator.sh
./aws/kops.sh
./aws/helm.sh
./aws/sops.sh
