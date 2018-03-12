#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null ; do sleep 1 ; done

for mon in $(xrandr --listactivemonitors | egrep "[A-Z]{3,4}-[0-9]$" -o) ; do
	MONITOR=$mon polybar jabocg &
done
# polybar jabocg &
# MONITOR=HDMI-2 polybar jabocg &
