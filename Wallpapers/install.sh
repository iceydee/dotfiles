#!/bin/bash

mkdir -p ~/Pictures/Wallpapers
for FILE in $(find ~/my/dotfiles/Wallpapers/*.jpg -type f); do
  ln -sf ${FILE} ~/Pictures/Wallpapers/$(basename ${FILE})
done
