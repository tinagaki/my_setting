#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
export PATH="$PATH:/usr/local/Cellar/git/2.27.0/bin/git"

# Customize to your needs...
alias ack='ag'
alias ls='exa -F'
alias cat='bat -p '
alias ps='procs'

alias mv='mv -i'
alias rm='rm -i'
#alias cp='cp -i'
alias sc='screen'
alias bash='/usr/local/bin/bash'
alias grep='grep --color=always '
