#!/usr/bin/bash

source ~/config/local_config.sh

xbindkeys
setxkbmap -layout pl,pl -variant dvp, -option caps:backspace,shift:both_capslock,grp:sclk_toggle
# caps lock repat
xset r 66

feh --bg-scale /usr/share/wallpapers/wallpaper.jpg
xcompmgr &

pkill -u $USER -f ^perl.*pstatus
pstatus &

exec dwm
