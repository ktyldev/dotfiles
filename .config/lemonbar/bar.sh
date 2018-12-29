#!/usr/bin/bash

font="Misc Tamsyn"
bar=$(which lemonbar)
config="$HOME/.config/lemonbar/config.sh"

# terminate already running bar instances
killall -q $bar

# wait until the processes have been shut down
while pgrep -u $UID -x $bar >/dev/null; do sleep 1; done

# launch bar
. $config | $bar -p -f "$font"
