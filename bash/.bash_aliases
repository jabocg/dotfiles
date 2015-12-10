#!/bin/bash
# User specific aliases and functions

# ls aliases
if [ "$(uname)" == "Darwin" ]; then
    alias ls="ls -axhlG"
else
    alias ls="ls -hl --color=auto --time-style=long-iso"
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

# assuming raspberry pi is at 192.168.1.42
alias sspi="ssh jgerszty@192.168.1.42"

alias isodate="date +%F"

alias vimnote="vim notes_$(isodate)"
alias vimnoted="vim notes_$(isodate).md"
