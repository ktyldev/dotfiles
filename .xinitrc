xrdb -load ~/.Xresources
sh ~/.fehbg

setxkbmap gb
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

exec bspwm
