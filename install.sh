#!/bin/bash
RUBY_VERSION="2.2.3"
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ORIG_DOTFILES=$DOTFILES
TMP_PATH="/tmp/dotfiles"
FIRA_URL="http://www.carrois.com/downloads/fira_mono_3_2/FiraMonoFonts3202.zip"
mkdir -p $TMP_PATH

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
  PACKAGES="ag ctags editorconfig git htop node rbenv rbenv-gem-rehash rename ruby-build ssh-copy-id tig tmux tree vim watch zsh"
  if prompt_ "[$PACKAGES]"; then
    install_osx "$PACKAGES"
  fi;
fi;

hash git 2>/dev/null || { echo >&2 "Git not found. Aborting"; exit 1; }
hash curl 2>/dev/null || { echo >&2 "curl not found. Aborting"; exit 1; }

colorize "Installing dominikc/dotfiles" 32

if hash rbenv 2>/dev/null && [ ! $(rbenv global) == $RUBY_VERSION ] && prompt_ "Install ruby-${RUBY_VERSION}?"; then
  rbenv install $RUBY_VERSION && rbenv global $RUBY_VERSION
fi

if hash emacs 2>/dev/null && [ ! -d "$HOME/.emacs.d" ] && prompt_ "Install spacemacs?"; then
  git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

if [ ! -d "$HOME/.zprezto" ] && prompt_ "Install zprezto?"; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
fi

if [ ! -d "$HOME/.vim/undodir" ] && prompt_ "Create undodir (vim)?"; then
  mkdir -p $HOME/.vim/undodir/

fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ] && prompt_ "Install vim-plug?"; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if hash nvim 2>/dev/null && [ ! -f "$HOME/.nvim/autoload/plug.vim" ] && prompt_ "Install vim-plug (neovim)?"; then
  curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if prompt_ "Install Powerline fonts?"; then
  git clone git://github.com/Lokaltog/powerline-fonts.git $TMP_PATH/powerline
  $TMP_PATH/powerline/install.sh
fi

if [ ! -f "$HOME/Library/Fonts/FiraMono-Regular.otf" ] && prompt_ "Install Fira Mono fonts?"; then
  cd $TMP_PATH;
  curl -O $FIRA_URL;
  unzip Fira*.zip;
  mv Fira*/OTF/*otf $HOME/Library/Fonts/
  cd -
fi

files=(agignore editorconfig gitignore_global tmux.conf tmuxline vimrc zshrc tigrc bin spacemacs)

for file in ${files[*]}
do
  if try_unlink "$HOME/.$file"; then (link_ $file); fi
done

if [ -d "$HOME/.zprezto" ]; then
  zsh_files=(zshrc zpreztorc zprofile zshenv zlogin)
  DOTFILES="$DOTFILES/zprezto"
  for file in ${zsh_files[*]}
  do
    if try_unlink "$HOME/.$file"; then (link_ $file); fi
  done
  DOTFILES="$ORIG_DOTFILES"
fi

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

rm -r $TMP_PATH
