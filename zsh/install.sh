#!/bin/bash

# Install base config
ln -sf ~/my/dotfiles/zsh/.zshrc ~/.zshrc
for FILE in `find ~/my/dotfiles/zsh/custom -type f`; do
  ln -sf ${FILE} ~/.oh-my-zsh/custom/`basename ${FILE}`
done

# Install plugins
g clone gusaiani/elixir-oh-my-zsh ~/.oh-my-zsh/custom/plugins/elixir
