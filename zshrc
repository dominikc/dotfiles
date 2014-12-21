export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
ZSH_THEME="fino"

COMPLETION_WAITING_DOTS="true"
[[ -n $TMUX ]] || DISABLE_AUTO_TITLE="true"

BUNDLED_COMMANDS=(rails)

plugins=(
  adb bundler git git-flow rails tmuxinator vundle zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"

test -f /usr/local/rvm/scripts/rvm && source /usr/local/rvm/scripts/rvm
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
