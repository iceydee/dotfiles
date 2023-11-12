#!/bin/bash

CUR_LIST=$(mktemp)

code --list-extensions | sort -u > "${CUR_LIST}"

IFS=$'\n'

for EXT in $(diff --suppress-common-lines "${CUR_LIST}" extensions | grep "^<" | cut -c3-); do
  code --uninstall-extension "${EXT}"
done

for EXT in $(diff --suppress-common-lines "${CUR_LIST}" extensions | grep "^>" | cut -c3-); do
  code --install-extension "${EXT}"
done

rm -f "${CUR_LIST}"
