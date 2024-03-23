#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '
#######################################################
# Set the ultimate amazing command prompt
#######################################################

. "$HOME/.cargo/env"

[ -f "/home/qberg/.ghcup/env" ] && . "/home/qberg/.ghcup/env" # ghcup-env

# Granularise bashrc
source /home/qberg/.shell/aliases
source /home/qberg/.shell/functions
