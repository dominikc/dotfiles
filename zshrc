export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$HOME/.bin:$PATH"
export EDITOR=vim

alias be='bundle exec'
alias e="$EDITOR"

alias ls='ls -G'
alias grep='grep --color=auto'

alias map="xargs -n1"
alias ll=k
alias l=k


alias gwd='git diff'
alias gid='git diff --cached'
alias gws='git status -s'
alias gb='git branch'
alias gco='git checkout'
alias gpush='git push'
alias sync!='git pull --rebase origin $(git config --get gitflow.branch.develop || echo "develop")'
alias bump!='vim VERSION && git commit -m "Bump version" VERSION'

source "$HOME/.zgen.zsh"

if ! zgen saved; then
  zgen load djui/alias-tips
  zgen load nojhan/liquidprompt
  zgen load rimraf/k
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

if [ -f "/usr/local/opt/grc/etc/grc.bashrc" ]; then
  source "/usr/local/opt/grc/etc/grc.bashrc"
fi
