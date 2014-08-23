#!/bin/bash

colorize() {
  echo -e "\x1B[1;$2m$1\x1B[0m";
}

try_unlink() {
  if [ -f $1 ] && [ ! -L $1 ] || [ -d $1 ]; then
    colorize "Object $1 exists" 31
    return 1;
  else
    rm -rf $1
    return 0;
  fi;
}

link_() {
  colorize "Linking $1" 32
  ln -s "$DOTFILES/$1" "$HOME/.$1";
}


if hash apt-get 2>/dev/null; then
  colorize "[Installing required packages]" 32
  sudo apt-get install git vim zsh
fi

hash git 2>/dev/null || { echo >&2 "Git not found. Aborting"; exit 1; }
hash zsh 2>/dev/null || { echo >&2 "Zsh not found. Aborting"; exit 1; }
hash vim 2>/dev/null || { echo >&2 "Vim not found. Aborting"; exit 1; }

colorize "[Installing DOTFILES]" 32
DOTFILES=$PWD

if try_unlink "$HOME/.vim/bundle/Vundle.vim"; then
  colorize "[Installing vundle]" 32
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi;

if try_unlink "$HOME/.vimrc"; then
  link_ "vimrc"
fi;

if try_unlink "$HOME/.zshrc"; then
  echo "Replacing zshrc";
fi;

if try_unlink "$HOME/.agignore"; then
  link_ "agignore"
fi;

vim +PluginInstall +qall

