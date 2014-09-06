export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
ZSH_THEME="fino"

COMPLETION_WAITING_DOTS="true"

BUNDLED_COMMANDS=(rails)

plugins=(
  adb archlinux bundler git rails rbenv systemd
  tmuxinator vundle zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
hash rvm 2>/dev/null && source /usr/local/rvm/scripts/rvm
