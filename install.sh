#!/bin/bash
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
  if [ -f $1 ] && [ ! -L $1 ] || [ -d $1 ] && [ ! -L $1 ]; then
    if prompt_ "Replace $1 ?"; then
      colorize "Copying $1 to $1.prev" 32
      cp -r "$1" "$1.prev"
      rm -rf $1; return 0
    else
      return 1;
    fi;
  else
    rm -f $1; return 0
  fi;
}

link_() {
  colorize "Linking $1" 32
  ln -s "$DOTFILES/$1" "$HOME/.$1"
}

if prompt_ "Install suggested packages? (recommended)"; then
  install_apt "git zsh tmux silversearcher-ag tig curl tree"
  install_arch "git zsh tmux tig the_silver_searcher tree"
  install_yum "git vim zsh tmux the_silver_searcher tig tree"
  install_osx "tmux"
fi;

hash git 2>/dev/null || { echo >&2 "Git not found. Aborting"; exit 1; }
hash zsh 2>/dev/null || { echo >&2 "Zsh not found. Aborting"; exit 1; }
hash vim 2>/dev/null || { echo >&2 "Vim not found. Aborting"; exit 1; }
hash curl 2>/dev/null || { echo >&2 "curl not found. Aborting"; exit 1; }

colorize "Installing dominikc/dotfiles" 32

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
    install_yum "gcc-c++ glibc-headers glibc-devel openssl-devel readline libyaml-devel readline-devel zlib zlib-devel patch"

    if prompt_ "Install pg/sqlite libs"; then
      install_apt "libsqlite3-dev libpq-dev"
      install_yum "libsqlite3x-devel postgresql-devel"
      install_arch "postgresql-libs sqlite3"
    fi

    if try_unlink "$HOME/.rbenv/plugins/ruby-build"; then
      git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
    fi
  fi

  if prompt_ "Install ruby-2.1.3?"; then
    rbenv install 2.1.3 && rbenv global 2.1.3
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

if prompt_ "Install Powerline fonts?"; then
  git clone git://github.com/Lokaltog/powerline-fonts.git $HOME/powerline
fi


files=(agignore editorconfig tmux.conf tmuxline vimrc zshrc)

for file in ${files[*]}
do
  if try_unlink "$HOME/.$file"; then (link_ $file); fi
done

if prompt_ "Install gitconfig?"; then
  if try_unlink "$HOME/.gitconfig"; then
    read -p "Please enter username: " username
    read -p "Please enter email: " email
    sed -e "s/GIT_USER_NAME/$username/" -e "s/GIT_USER_EMAIL/$email/" \
      $DOTFILES/gitconfig > $HOME/.gitconfig
  fi
fi

if prompt_ "Install extra dotfiles?"; then
  mkdir -p $HOME/.ncmpcpp
  DOTFILES="$DOTFILES/extra"
  files=(Xdefaults i3 tigrc yaourtrc ncmpcpp/config)
  for file in ${files[*]}
  do
    if try_unlink "$HOME/.$file"; then (link_ $file); fi
  done
fi

echo "Type 'vundle install' to install VIM plugins"
