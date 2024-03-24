#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;124m\][\[\e[38;5;148m\]\u\[\e[38;5;166m\]@\[\e[38;5;110m\]\h\[\e[0m\] \[\e[38;5;245m\]\w\[\e[38;5;124m\]]\[\e[0m\] \[\e[38;5;180m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;196m\]<3\[\e[0m\] '

. "$HOME/.cargo/env"

[ -f "/home/qberg/.ghcup/env" ] && . "/home/qberg/.ghcup/env" # ghcup-env
# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# Granularise bashrc
source /home/qberg/.shell/aliases
source /home/qberg/.shell/functions

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
