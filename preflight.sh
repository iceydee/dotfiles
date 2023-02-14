#!/bin/bash

ABORT=0

function checkDependency {
  local cmd="${1}"
  local name
  if [ -z "${2}" ]; then
    name="${cmd}"
  else
    name="${2}"
  fi
  which "${cmd}" >/dev/null
  if [ "$?" -ne 0 ]; then
    ABORT=1
    echo "${name} is missing."
  fi
}

function checkDir {
  local dir="${1}"
  local name="${2}"

  if [ ! -d "${dir}" ]; then
    ABORT=1
    echo "${name} is missing."
  fi
}

checkDependency git
checkDependency rvm
checkDependency ruby
checkDir "${HOME}/.nvm" nvm
checkDependency node
checkDependency go golang
checkDependency curl
checkDependency chromium
checkDependency slack
checkDependency code vscode

exit ${ABORT}
