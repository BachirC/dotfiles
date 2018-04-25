### Git

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
alias g='which git'
alias gco='git commit '
alias gdf='git diff '
alias gdfc='git diff --cached'
alias ga='git add '
alias gch='git checkout '
alias gst='git stash '
alias gss='git status '
# Pass commit hash to list all files affected
alias gls='git diff-tree --no-commit-id --name-only -r'
alias git='hub'
__git_complete g _git
__git_complete gch _git_checkout
__git_complete gdf _git_diff
__git_complete ga _git_add

function parse_git_dirty {
    [[ -n "$(git status -s 2> /dev/null)" ]] && echo "*"
  }
function parse_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)$(parse_git_stash)/"
}

### Docker

alias dco='docker-compose '

### Prompt

export PS1="\[\e[0;93m\]\w \[\e[0m\]\[\e[32m\]\$(parse_git_branch)\[\e[00m\] $ "
export HISTSIZE=100000
export NVM_DIR="/Users/BachirC/.nvm"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

### NVM

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Bash

# alias ls='ls -la'
alias ..='cd ..'
export PATH="/usr/local/sbin:$PATH"

# rbenv

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Elixir
if [ -f "$HOME/bash_completion.d/mix" ] ; then
  source $HOME/bash_completion.d/mix
fi # mix autocompletion

# Add Erlang Rebar3 to PATH
export PATH=$PATH:/Users/BachirC/.cache/rebar3/bin
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

# IEX history
export ERL_AFLAGS="-kernel shell_history enabled"

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# Editor
export EDITOR='vim'

# Tmuxinator completion
. ~/.bin/tmuxinator.bash

# Go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# ls only symbolic links
alias ls_sym="find . -maxdepth 1 -type l -ls"
export GPG_TTY=$(tty)
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/.bin:$PATH"

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Source confidential stuff.
if [ -f ~/.secrets.bash ]; then
  . ~/.secrets.bash
fi
