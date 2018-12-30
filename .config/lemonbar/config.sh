#!/usr/bin/bash

# TODO:
#
# workspace 
# current window 
# volume

# import colours from pywal
. "$HOME/.cache/wal/colors.sh"
fg="$color8"
bg="$color0"

set_colours() {
  echo -n "%{F$fg}%{B$bg}"
}

set_inverse_colours() {
  echo -n "%{F$bg}%{B$fg}"
}

battery() {
  echo -n $(acpi -b) | cut -d, -f3 | awk '{$1=$1;print}' | gawk -F ":" '{print$1":"$2}'
}

clock() {
  echo -n $(date +"%d/%m/%y %T")
}

while true; do
  # kill process once x is no longer running
  if ! pgrep -x "Xorg" > /dev/null 
  then
    break
  fi

  echo -n "$(set_colours) %{r}$(battery) $(clock) "
  sleep 1;
done
