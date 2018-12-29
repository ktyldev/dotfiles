#!/usr/bin/bash

# TODO:
#
# colours
# workspace 
# current window 

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

  echo -n "%{r}$(battery) $(clock) "
  sleep 1;
done
