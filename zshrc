export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fino"

COMPLETION_WAITING_DOTS="true"

BUNDLED_COMMANDS=(rails)
plugins=(git rbenv bundler vundle brew)
alias pry_rails="BUNDLE_GEMFILE=Gemfile.local bundle exec rails console"
alias devlog="tail -f log/development.log"
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
hash rvm 2>/dev/null && source /usr/local/rvm/scripts/rvm
[[ -z "$TMUX" ]] && exec tmux -2
