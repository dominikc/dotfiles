export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$HOME/.bin:$PATH"
export EDITOR=vim

# Aliases
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

# Key bindings
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# History
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history

_prompt_git_branch () {
  ref=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ ! -z $ref ]; then
    _PROMPT=" %{$fg[green]%}git%{$reset_color%}:%{$fg[blue]%}${ref}%{$reset_color%}"
    _PROMPT="${_PROMPT}:%{$fg[magenta]%}$(git rev-parse --short HEAD)%{$reset_color%}"

    INDEX=$(command git status --porcelain -b 2> /dev/null);

    _GIT_STATUS_ADDED="%{$fg[green]%}*%{$reset_color%}"
    _GIT_STATUS_MODIFIED="%{$fg[red]%}*%{$reset_color%}"
    _GIT_STATUS_UNTRACKED="%{$fg[white]%}?%{$reset_color%}"

    if $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
      _PROMPT="${_PROMPT}${_GIT_STATUS_ADDED}"
    elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
      _PROMPT="${_PROMPT}${_GIT_STATUS_ADDED}"
    fi

    if $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
      _PROMPT="${_PROMPT}${_GIT_STATUS_MODIFIED}"
    elif $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      _PROMPT="${_PROMPT}${_GIT_STATUS_MODIFIED}"
    fi

    if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
      _PROMPT="${_PROMPT}${_GIT_STATUS_UNTRACKED}"
    fi

    echo "$_PROMPT"
  fi
}

_prompt_rbenv_version () {
  echo " %{$fg[red]%}rbenv%{$reset_color%}:%{$fg[blue]%}$(rbenv version-name)%{$reset_color%}"
}

# Prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT='
[%{$fg[green]%}%n%{$reset_color%}:%{$fg[blue]%}%0~%{$reset_color%}]
%{$fg_bold[magenta]%}%%%{$reset_color%} '
RPROMPT='$(_prompt_git_branch)$(_prompt_rbenv_version)'

# Plugins
source "$HOME/.zgen.zsh"

if ! zgen saved; then
  zgen load djui/alias-tips
  zgen load rimraf/k
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

if [ -f "/usr/local/opt/grc/etc/grc.bashrc" ]; then
  source "/usr/local/opt/grc/etc/grc.bashrc"
fi
