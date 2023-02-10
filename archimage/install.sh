#!/bin/bash

BASHSTRAP="${HOME}/src/archbashstrap"

mkdir -p "${HOME}/src"

if [ ! -d "${BASHSTRAP}" ]; then
  git clone https://github.com/BiteDasher/archbashstrap "${BASHSTRAP}"
fi
