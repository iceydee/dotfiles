ln -sf ~/my/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/my/dotfiles/vim/.vimrc ~/.vimrc
for FILE in `find ~/my/dotfiles/zsh/custom -type f`; do
  ln -sf ${FILE} ~/.oh-my-zsh/custom/`basename ${FILE}`
done
