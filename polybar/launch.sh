#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null ; do sleep 1 ; done

polybar jabocg &
MONITOR=HDMI-2 polybar jabocg &
