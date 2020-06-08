#!/usr/bin/bash

source ~/config/local_config.sh
LC_CTYPE=pl_PL.UTF-8
LANG=pl_PL.UTF-8

xbindkeys
setxkbmap -layout pl,pl -variant dvp, -option caps:backspace,shift:both_capslock,grp:sclk_toggle
# caps lock repat
xset r 66

feh --bg-scale /usr/share/wallpapers/wallpaper.jpg
compton --backend glx --blur-background --blur-method kawase -b

pkill -u $USER -f ^perl.*pstatus
pstatus &

exec dwm
