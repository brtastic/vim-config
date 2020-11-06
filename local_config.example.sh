#!/usr/bin/env bash

# xhost + local:
# export DISPLAY=localhost:0
# export "MON_CONFIG=HDMI1;eDP1;right"
# export BATTERY_NAME=BAT1
export SOUND_DEVICE=Master

# fix DWM java apps
export _JAVA_AWT_WM_NONREPARENTING=1
