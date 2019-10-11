#!/bin/sh

update_config_file() {
  echo "Updating $1 config..."
  cat ~/$2 > $(pwd)/$2
}

echo "Saving NeoVim config into .vimrc..."
cat ~/.config/nvim/init.vim > ~/.vimrc

update_config_file "Vim" ".vimrc"
update_config_file "Tmux" ".tmux.conf"
update_config_file "Git" ".gitconfig"
update_config_file "ZSH" ".zshrc"
update_config_file "Git ignore" ".gitignore"
update_config_file "Silver Surfer" ".agignore"
update_config_file "ANSI Weather" ".ansiweatherrc"

echo "-----------------------------"
echo "-------- All done! ----------"
echo "-----------------------------"
