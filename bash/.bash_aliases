#!/bin/bash
# User specific aliases and functions

# OS biased aliases
if [ "$(uname)" == "Darwin" ]; then # Mac OS
    alias ls="ls -axhlG"
    alias grep="grep --color=always"
    alias tree="tree -C"
    alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"
else # others(Fedora? nothing else I really run is used)
    alias ls="ls -hl --color=auto --time-style=long-iso"
    # alias to ssh into pi, should change IP as needed
    alias sspi="ssh jgerszty@192.168.1.42"
fi

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

alias isodate="date +%F"

alias vimnote="vim notes_$(isodate)"
alias vimnoted="vim notes_$(isodate).md"

# alias for development environment with tmux
alias dev="dev && exit"
