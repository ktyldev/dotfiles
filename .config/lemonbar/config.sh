#!/usr/bin/bash

# TODO:
#
# colours
# workspace 
# current window 
# better date format

battery() {
  echo -n $(acpi -b) | cut -d, -f3 | awk '{$1=$1;print}' | gawk -F ":" '{print$1":"$2}'
}

clock() {
  echo -n $(date)
}

while true; do
  # kill process once x is no longer running
  if ! pgrep -x "Xorg" > /dev/null 
  then
    break
  fi

  echo -n "%{r}$(battery) $(clock)"
  sleep 1;
done
