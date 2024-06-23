#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
export EDITOR=nvim
export VISUAL=nvim

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source ~/.shell/git-prompt.sh

#PS1='[\u@\h \W]\$ '
#######################################################
# Set the ultimate amazing command prompt
#######################################################
#if [[ -f ~/.bash_prompt ]]; then
#  . ~/.bash_prompt
#fi
#PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='[\u@\W ${PS1_CMD1}] '
#PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='[\u@\h \w <${PS1_CMD1}>] '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='[\u@\h \w] ${PS1_CMD1} '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;124m\][\[\e[38;5;148m\]\u\[\e[38;5;166m\]@\[\e[38;5;110m\]\h\[\e[0m\] \[\e[38;5;245m\]\w\[\e[38;5;124m\]]\[\e[0m\] \[\e[38;5;216m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;196m\]<3\[\e[0m\] '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;124m\][\[\e[38;5;148m\]\u\[\e[38;5;166m\]@\[\e[38;5;110m\]\h\[\e[0m\] \[\e[38;5;245m\]\w\[\e[38;5;124m\]]\[\e[0m\] \[\e[38;5;180m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;196m\]<3\[\e[0m\] '
# Gradient like
PS1="\[$(tput setaf 243)\]\u\[$(tput setaf 245)\]@\[$(tput setaf 249)\]\h \[$(tput setaf 254)\]\w$(__git_ps1 " (%s)") \[$(tput sgr0)\]$ "
#PS1="\[$(tput setaf 246)\]\u\[$(tput setaf 248)\]@\[$(tput setaf 250)\]\h \[$(tput setaf 229)\]\w \[$(tput sgr0)\]$ "
PATH=$PATH:~/.local/bin

. "$HOME/.cargo/env"

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# Granularise bashrc
source /home/qberg/.shell/aliases
source /home/qberg/.shell/functions

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f "/home/qberg/.ghcup/env" ] && . "/home/qberg/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
