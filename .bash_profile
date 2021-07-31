export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
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
alias gbr='git branch '
alias gpu='git pull '
# Pass commit hash to list all files affected
alias gls='git diff-tree --no-commit-id --name-only -r'
alias git='hub'
alias hexdocs='mix hex.docs online'
alias gfix='$EDITOR `git diff --name-only --relative | uniq`'
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

# Open conflicting files in vim
function editconflicts() {
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}

### Docker

alias dco='docker-compose '

### Prompt

export PS1="\[\e[0;93m\]\W \[\e[0m\]\[\e[32m\]\$(parse_git_branch)\[\e[00m\] $ "
export HISTSIZE=1000000
export NVM_DIR="/Users/BachirC/.nvm"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

### NVM

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Bash

# alias ls='ls -la'
alias ..='cd ..'
export PATH="/usr/local/sbin:$PATH"

### Elixir
if [ -f "$HOME/bash_completion.d/mix" ] ; then
  source $HOME/bash_completion.d/mix
fi # mix autocompletion

alias mixf_diff="git diff --name-only --relative=src/services/invoice origin/master | grep \
'.exs\?$' | xargs mix format"

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

export PATH="$HOME/.bin:$PATH"

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Source confidential stuff.
[ -f ~/.secrets.bash ] && . ~/.secrets.bash


# Confluent
export ZK="localhost:2181"
export KB="localhost:9092"
export KAFKA_CLIENT_PATH=$HOME/confluent-5.0.0/bin
export PATH="$KAFKA_CLIENT_PATH:$PATH"

# Homebrew
export HOMEBREW_AUTO_UPDATE_SECS=600000

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/bachir/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# hh
# Whenever a command is executed, write it to a global history
PROMPT_COMMAND="history -a ~/.bash_history.global; $PROMPT_COMMAND"
# On C-r set HISTFILE and run hh
bind -x '"\C-r": "HISTFILE=~/.bash_history.global hh"'
export PATH="$HOME/.erlenv/bin:$PATH"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
