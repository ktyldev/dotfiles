#!/usr/bin/bash

# TODO:
#
# battery
# colours
# workspace 
# current window 
# better date format

clock() {
  echo -n $(date)
}

while true; do
  echo "%{r}$(clock)"
  sleep 1;
done
