#!/bin/sh
xscreensaver -nosplash &
urxvtd &
conky -c ~/.config/wmfs/conky-status > /dev/null &

exec ck-launch-session wmfs & wmpid=$!

sh ~/.fehbg &
claws-mail &
#firefox-bin &


while true; do sleep 1; ~/.config/wmfs/status.sh; done &

wait $wmpid
