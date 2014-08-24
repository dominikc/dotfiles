export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fino"

COMPLETION_WAITING_DOTS="true"

plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"

[[ -z "$TMUX" ]] && exec tmux -2
