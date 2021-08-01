export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

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

### Prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
RPROMPT='%*'
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

### Bash

alias ..='cd ..'
alias openvimc='vim /Users/bachir/.config/nvim/init.vim'

# Editor
alias vim='nvim'
export EDITOR='nvim'

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Source confidential stuff.
[ -f ~/.secrets.bash ] && . ~/.secrets.bash

# Command history
bindkey '^R' history-incremental-search-backward
export HISTFILE=~/.zsh_history # Save history to file
export HISTFILESIZE=1000000000 # Increase history file size
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY # Append to history immediately instead of when exiting the shell
export HISTTIMEFORMAT="[%F %T] "
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# tmux
alias tmux='tmux -2 '
alias t='tmux'

# https://stackoverflow.com/questions/18835465/control-e-in-tmux-does-not-bring-me-to-end-of-line
bindkey -e

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/erlang@21/bin:$PATH"
