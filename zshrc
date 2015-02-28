LC_MESSAGES="en_US.UTF-8"
LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"

export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
ZSH_THEME="kphoen"

COMPLETION_WAITING_DOTS="true"
[[ -n $TMUX ]] || DISABLE_AUTO_TITLE="true"

BUNDLED_COMMANDS=(rails)

plugins=(
  adb bundler git git-flow rails rbenv tmuxinator vundle zsh-syntax-highlighting history-substring-search
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:$PATH"

test -f /usr/local/rvm/scripts/rvm && source /usr/local/rvm/scripts/rvm
alias sync!="git pull --rebase origin develop"
alias push!=ggpush
