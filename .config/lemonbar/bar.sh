#!/usr/bin/bash

font="Misc Tamsyn"
bar=$(which lemonbar)
config="$HOME/.config/lemonbar/config.sh"

. $config | $bar -p -f "$font"
