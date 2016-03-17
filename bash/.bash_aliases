#!/bin/bash
# User specific aliases and functions

# OS biased aliases
if [ "$(uname)" == "Darwin" ]; then # Mac OS
    alias ls="ls -axhlG"
    alias grep="grep --color=always"
    alias tree="tree -C"
    alias vim="mvim -v"
    alias vbashrc="vim ~/.bash_profile"

    # This check will set the alias if you are trying to run launchctl inside screen or tmux
    # it may need to be updated with other $TERM values
    if [ $TERM == "screen-256color" ] ; then
        alias launchctl="echo 'DO NOT RUN THIS INSIDE OF SCREEN OR TMUX'"
    fi

else # others(Fedora? nothing else I really run is used)
    alias ls="ls -hal --color=auto --time-style=long-iso"
    alias lsd="ls -hald */ .*/"

    # alias to ssh into pi, should change IP as needed
    alias sspi="ssh jgerszty@192.168.1.42"

    # Alias to rename files with
    alias prename="/home/jabocg/bin/prename.pl"

    # Lenovo battery stuff
    if [ -e /sys/class/power_supply/BAT1 ] ; then
        BATTERY="/sys/class/power_supply/BAT1"
        BATFULL="$(cat $BATTERY/energy_full)"
        function batt() {
            BATCUR="$(cat $BATTERY/energy_now)"
            let " BATPERC = BATCUR * 100 / BATFULL "
            echo $BATPERC
        }
    fi
fi


alias pve2="source ~/.venv/py2/bin/activate"
alias pve3="source ~/.venv/py3/bin/activate"

alias isodate="date +%F"

alias vimnote="vim notes_$(isodate)"
alias vimnoted="vim notes_$(isodate).md"

# nuke alias, because funtimes
alias nuke='rm -rf'

# telling tree command to ignore .git structures
alias tree='tree -I .git -C'

# edit vimrc quickly
alias vvimrc='vim ~/.vimrc'

# ed alias, possibly useless but wfc
alias ed='ed -p:'
