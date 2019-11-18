#!/bin/bash

sudo apt install -y postgresql-client libdbd-pg-perl sqitch

mkdir -p ${HOME}/.sqitch
ln -sf ${HOME}/my/dotfiles/sqitch/sqitch.conf ${HOME}/.sqitch/sqitch.conf
