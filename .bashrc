# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Aliases
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'

alias df='df -h'
alias du='du -h'

alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias ls='ls -ahlF --color=tty'               # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Colour prompt
#
export PS1="\[$(tput bold)\]\[\033[38;5;2m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;35m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \W\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;2m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\]"
#source /usr/local/bin/activate.sh

# Use VIM for man pages
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 tw=120 wm=2 wrap linebreak nomod nolist nonu noma' -\""

# For python/flask dev. (using virtualenv): 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# When you cd into a directory containing a .env, 
# autoenv automagically activates the environment.
# autoenv is located in your home folder ~/.autoenv/...
# installed using instructions here: https://python-guide.readthedocs.io/en/latest/dev/virtualenvs/
source ~/.autoenv/activate.sh
