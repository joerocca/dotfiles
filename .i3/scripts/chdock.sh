#!/bin/bash

IN="eDP-1"
EXT1="DP-1"
EXT2="DP-2"

if (xrandr | grep -q "$EXT1 disconnected"); then
    xrandr --output $EXT1 --off --output $IN --primary --mode 3200x1800 --pos 0x0 --rotate normal --output $EXT2 --off
else
    xrandr --output $EXT1 --mode 1920x1080 --pos 3200x0 --rotate normal --scale 2x2 --panning 3840x2160+3200+0 --output $IN --primary --mode 3200x1800 --pos 0x0 --rotate normal --output $EXT2 --off
    # move workspaces 6-10 to EXT1
    i3-msg -q workspace 6: Chrome, move workspace to output $EXT1
    i3-msg -q workspace 7: Notes, move workspace to output $EXT1
    i3-msg -q workspace 8: Spotify, move workspace to output $EXT1
    i3-msg -q workspace 9: Slack, move workspace to output $EXT1
    i3-msg -q workspace 10: WhatsApp, move workspace to output $EXT1
fi

# set EXT1 background
feh --bg-fill ${HOME}/Pictures/conifer-daylight.jpg --bg-fill ${HOME}/Pictures/conifer-daylight.jpg
