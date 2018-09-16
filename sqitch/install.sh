#!/bin/bash

sudo apt install -y postgresql-client-10

mkdir -p ${HOME}/.sqitch
ln -sf ${HOME}/my/dotfiles/sqitch/sqitch.conf ${HOME}/.sqitch/sqitch.conf
