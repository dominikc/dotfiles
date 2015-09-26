export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

_prompt_rbenv_version () {
  if which rbenv > /dev/null; then
    _PROMPT="%{$fg[red]%}$(rbenv version-name)%{$reset_color%}"
    _PROMPT="[${_PROMPT}]"
    echo "${_PROMPT}"
  fi
}

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
alias gpush='git push origin $(git-branch-current)'
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

git-branch-current() {
  git symbolic-ref --short HEAD
}

_prompt_git_branch () {
  ref=$(git rev-parse --short HEAD 2>/dev/null)
  if [ ! -z $ref ]; then
    symbolic_ref=$(git describe --contains --all HEAD 2>/dev/null)
    _PROMPT=""

    if [ ! -z $symbolic_ref ]; then
      _PROMPT="%{$fg[blue]%}${symbolic_ref}%{$reset_color%}:"
    fi

    _PROMPT="${_PROMPT}%{$fg[magenta]%}${ref}%{$reset_color%}"

    INDEX=$(command git status --porcelain -b 2> /dev/null);

    _GIT_STATUS=""
    _GIT_STATUS_ADDED="%{$fg[green]%}*%{$reset_color%}"
    _GIT_STATUS_MODIFIED="%{$fg[red]%}*%{$reset_color%}"
    _GIT_STATUS_UNTRACKED="%{$fg[white]%}?%{$reset_color%}"

    if $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
      _GIT_STATUS="${_GIT_STATUS}${_GIT_STATUS_ADDED}"
    elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
      _GIT_STATUS="${_GIT_STATUS}${_GIT_STATUS_ADDED}"
    fi

    if $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
      _GIT_STATUS="${_GIT_STATUS}${_GIT_STATUS_MODIFIED}"
    elif $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      _GIT_STATUS="${_GIT_STATUS}${_GIT_STATUS_MODIFIED}"
    fi

    if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
      _GIT_STATUS="${_GIT_STATUS}${_GIT_STATUS_UNTRACKED}"
    fi

    echo "[${_GIT_STATUS}${_PROMPT}]"
  fi
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
