#!/bin/bash
# User specific aliases and functions
alias targz="tar -vxzf"

# ls aliases
alias ls="ls -hl --color=auto --time-style=long-iso"

# Alias to copy GitHub SSH key
#   probably unsafe, but oh well
alias gitkey="cbf ~/Documents/Programming/GitHubkeys"

# Alias to rename files with
alias prename="/home/jabocg/bin/prename.pl"

# Lenovo battery stuff
BATTERY="/sys/class/power_supply/BAT1"
BATFULL="$(cat $BATTERY/energy_full)"
function batt() {
    BATCUR="$(cat $BATTERY/energy_now)"
    let " BATPERC = BATCUR * 100 / BATFULL "
    echo $BATPERC
}
