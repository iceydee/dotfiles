#!/bin/bash

sudo apt install -y postgresql-client-10 libdbd-pg-perl sqitch

mkdir -p ${HOME}/.sqitch
ln -sf ${HOME}/my/dotfiles/sqitch/sqitch.conf ${HOME}/.sqitch/sqitch.conf
