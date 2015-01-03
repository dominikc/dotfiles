#!/bin/bash
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ORIG_DOTFILES=$DOTFILES
TMP_PATH="/tmp/dotfiles"

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
install_osx() { if hash brew 2>/dev/null; then brew install $1; fi }

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
  install_osx "vim tmux rbenv ruby-build rbenv-gem-rehash ag tig htop ssh-copy-id git tree ctags zsh"
fi;

hash git 2>/dev/null || { echo >&2 "Git not found. Aborting"; exit 1; }
hash zsh 2>/dev/null || { echo >&2 "Zsh not found. Aborting"; exit 1; }
hash vim 2>/dev/null || { echo >&2 "Vim not found. Aborting"; exit 1; }
hash curl 2>/dev/null || { echo >&2 "curl not found. Aborting"; exit 1; }

colorize "Installing dominikc/dotfiles" 32

if prompt_ "Install ruby (rbenv)?"; then
  if prompt_ "Install ruby-2.2.0?"; then
    rbenv install 2.2.0 && rbenv global 2.2.0
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
  git clone git://github.com/Lokaltog/powerline-fonts.git $TMP_PATH/powerline
  $TMP_PATH/powerline/install.sh
fi

files=(agignore editorconfig tmux.conf tmuxline vimrc zshrc tigrc)

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

if prompt_ "Install solarized OS X terminal theme?"; then
  git clone https://github.com/tomislav/osx-terminal.app-colors-solarized $TMP_PATH/solarized
  open "$TMP_PATH/solarized/Solarized Dark.terminal"
  open "$TMP_PATH/solarized/Solarized Light.terminal"
fi

echo "Type 'vundle install' to install VIM plugins"
