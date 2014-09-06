#!/bin/bash

prompt_() {
  while true; do
    read -p "$1 (y/N) " yn
    case $yn in
      [Yy]*) return 0 ;;
      *) return 1 ;;
    esac;
  done
}

colorize() { echo -e "\x1B[1;$2m$1\x1B[0m"; }
install_apt() { if hash apt-get 2>/dev/null; then sudo apt-get install $1; fi }
install_osx() { if hash brew 2>/dev/null; then brew install $1; fi }
install_yum() { if hash yum 2>/dev/null; then sudo yum install $1; fi }
install_arch() { if hash pacman 2>/dev/null; then sudo pacman -S $1; fi }

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

if prompt_ "Install suggested packages? (recommended)"; then
  install_apt "git vim zsh tmux silversearcher-ag tig curl vifm tree"
  install_arch "git vim-minimal zsh tmux tig the_silver_searcher vifm tree"
  install_yum "git vim zsh tmux the_silver_searcher tig vifm tree"
  install_osx "tmux vifm tree"
fi;

hash git 2>/dev/null || { echo >&2 "Git not found. Aborting"; exit 1; }
hash zsh 2>/dev/null || { echo >&2 "Zsh not found. Aborting"; exit 1; }
hash vim 2>/dev/null || { echo >&2 "Vim not found. Aborting"; exit 1; }
hash curl 2>/dev/null || { echo >&2 "curl not found. Aborting"; exit 1; }

colorize "Installing dominikc/dotfiles" 32
DOTFILES=$PWD

if prompt_ "Install ruby (rbenv)?"; then
  if prompt_ "Install rbenv?"; then
    if try_unlink "$HOME/.rbenv"; then
      colorize "Installing rbenv..." 32
      git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
    fi
  fi

  if prompt_ "Install ruby-build?"; then
    colorize "Installing suggested packages" 32
    install_osx "openssl libyaml"
    install_apt "autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev"
    install_yum "gcc-c++ glibc-headers glibc-devel openssl-devel readline libyaml-devel readline-devel zlib zlib-devel"

    if prompt_ "Install pg & libsqlite3?"; then
      install_apt "libsqlite3-dev libpq-dev"
      install_yum "libsqlite3x-devel postgresql-devel"
      install_arch "postgresql-libs sqlite3"
    fi

    if try_unlink "$HOME/.rbenv/plugins/ruby-build"; then
      git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
    fi
  fi

  if prompt_ "Install ruby-2.1.2?"; then
    rbenv install 2.1.2 && rbenv global 2.1.2
  fi
fi


if prompt_ "Install oh-my-zsh?"; then
  if try_unlink "$HOME/.oh-my-zsh"; then
    colorize "Installing oh-my-zsh..." 32
    curl -L http://install.ohmyz.sh | sh
    rm -f $HOME/.zshrc
  fi

  if try_unlink "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"; then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
      "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  fi
fi

if try_unlink "$HOME/.agignore";      then (link_ "agignore"); fi
if try_unlink "$HOME/.editorconfig";  then (link_ "editorconfig"); fi
if try_unlink "$HOME/.tigrc";         then (link_ "tigrc"); fi
if try_unlink "$HOME/.tmux.conf";     then (link_ "tmux.conf"); fi
if try_unlink "$HOME/.tmuxline";      then (link_ "tmuxline"); fi
if try_unlink "$HOME/.vimrc";         then (link_ "vimrc"); fi
if try_unlink "$HOME/.zshrc";         then (link_ "zshrc"); fi

if prompt_ "Install gitconfig?"; then
  if try_unlink "$HOME/.gitconfig"; then
    read -p "Please enter username: " username
    read -p "Please enter email: " email
    sed -e "s/GIT_USER_NAME/$username/" -e "s/GIT_USER_EMAIL/$email/" \
      $DOTFILES/gitconfig > $HOME/.gitconfig
  fi
fi

echo "Type 'vundle install' to install VIM plugins"
