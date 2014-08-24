#!/bin/bash

os="linux"

prompt_() {
  while true; do
    read -p "$1 (y/N) " yn
    case $yn in
      [Yy]*) return 0 ;;
      *) return 1 ;;
    esac;
  done
}

colorize() {
  echo -e "\x1B[1;$2m$1\x1B[0m"
}

try_unlink() {
  if [ -f $1 ] && [ ! -L $1 ] || [ -d $1 ]; then
    if prompt_ "Replace $1 ?"; then
      rm -rf $1; return 0
    else
      return 1;
    fi;
  else
    rm -rf $1; return 0
  fi;
}

link_() {
  colorize "Linking $1" 32
  ln -s "$DOTFILES/$1" "$HOME/.$1"
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
  colorize "Installing vundle..." 32
  git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi;

if try_unlink "$HOME/.vimrc";         then (link_ "vimrc"); fi
if try_unlink "$HOME/.agignore";      then (link_ "agignore"); fi
if try_unlink "$HOME/.editorconfig";  then (link_ "editorconfig"); fi
if try_unlink "$HOME/.tmux.conf";     then (link_ "tmux.conf"); fi

if prompt_ "Install rbenv?"; then
  if try_unlink "$HOME/.rbenv"; then
    colorize "Installing rbenv..." 32
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  fi
fi

if prompt_ "Install oh-my-zsh?"; then
  if try_unlink "$HOME/.oh-my-zsh"; then
    colorize "Installing oh-my-zsh..." 32

    if hash curl 2>/dev/null; then
      curl -L http://install.ohmyz.sh | sh
    else
      wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    fi

    rm -f $HOME/.zshrc
  fi
fi

if try_unlink "$HOME/.zshrc"; then (link_ "zshrc"); fi

if prompt_ "Install Tomorrow Night theme? (Ubuntu)"; then
  curl -L https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/Gnome-Terminal/setup-theme.sh | bash
fi;

vim +PluginInstall +qall
