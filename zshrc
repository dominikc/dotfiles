export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$HOME/.bin:$PATH"
export EDITOR=vim

alias be='bundle exec'
alias e="$EDITOR"

alias gwd='git diff'
alias gid='git diff --cached'
alias gws='git status -s'
alias gb='git branch'
alias gco='git checkout'

alias sync!='git pull --rebase origin $(git config --get gitflow.branch.develop || echo "develop")'
alias bump!='vim VERSION && git commit -m "Bump version" VERSION'

source "$HOME/.zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh
  zgen load rimraf/k
  zgen load djui/alias-tips
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  zgen oh-my-zsh themes/sorin
  zgen save
fi
