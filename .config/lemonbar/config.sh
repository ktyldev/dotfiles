#!/usr/bin/bash

# import colours from pywal
. "$HOME/.cache/wal/colors.sh"
foreground="$color8"
background="$color0"
update=0.2

set_colours() {
  echo -n "%{F$foreground}%{B$background}"
}

set_inverse_colours() {
  echo -n "%{F$background}%{B$foreground}"
}

battery() {
  echo -n $(acpi -b) | cut -d, -f3 | awk '{$1=$1;print}' | gawk -F ":" '{print$1":"$2}'
}

clock() {
  echo -n $(date +"%d/%m/%y %T")
}

bspwm() {
  # get status of workspaces, cut out unnecessary parts at beginning and
  # end. could be improved by slicing an array.
  status=$(bspc wm -g | cut -d: -f2-11)
  
  IFS=':' read -r -a arr <<< $status 

  for element in "${arr[@]}"
  do
    if [[ $element = F* || $element = O* ]]; then
      # this will only print one char of the workspace name. make it read
      # to end!
      echo -n $(set_inverse_colours) "${element:1}" $(set_colours)
    fi
  done
}

xwindow() {
  title=$(xdotool getactivewindow getwindowname)
  maxlength=60

  size=${#title}
  if [ $size -gt $maxlength ]; then
    title="${title:0:$maxlength}..."
  fi

  echo -n $title
}

volume() {
  vol=$(amixer get Master \
    | grep % \
    | awk '{print $5}' \
    | sed 's/[^0-9]//g' \
    | head -n 1)

  echo -n $vol
}

while true; do
  # kill process once x is no longer running
  if ! pgrep -x "Xorg" > /dev/null 
  then
    break
  fi

  echo -n "%{l} $(bspwm) $(xwindow) %{r}$(battery) $(volume) $(clock) "
  sleep $update;
done
