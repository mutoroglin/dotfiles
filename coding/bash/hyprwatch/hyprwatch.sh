#!/bin/bash

######################################
# HYPRWATCH
# version: 1.2
# author: mutoroglin@posteo.org
# license: GPL3
# change-log
#     v 1.2: added $XDG_RUNTIME_DIR to UNIX-CONNECT
#     v 1.3: removed monitor specification to display on screen and projector
######################################

########### la rotonde ###########
#wallpaper1='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/rotonde/la_rotonde_1920x1080.png"'
#wallpaper2='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/rotonde/vinside2_not_rotonde_1920x1080.png"'
#wallpaper3='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/rotonde/bar_not_rotonde_1920x1080.png"'
#wallpaper4='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/rotonde/kitchen2_not_rotonde_1920x1080.png"'
#wallpaper5='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/rotonde/back-alley2_not_rotonde_1920x1080.png"'

########### fantasy ###########
wallpaper1='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/fantasy/village_1920x1080.png"'
wallpaper2='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/fantasy/night_talk_1920x1080.png"'
wallpaper3='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/fantasy/drowfight_1920x1080.png"'
wallpaper4='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/fantasy/hordes_1920x1080.png"'
wallpaper5='hyprctl hyprpaper wallpaper ",~/Pictures/wallpaper/fantasy/dragons_1920x1080.png"'

handle() {
    case $1 in
        workspace*)
             case ${1:11:1} in
                 1) echo -n "set wallpaper #1 ... "; eval "$wallpaper1" ;;
                 2) echo -n "set wallpaper #2 ... "; eval "$wallpaper2" ;;
                 3) echo -n "set wallpaper #3 ... "; eval "$wallpaper3" ;;
                 4) echo -n "set wallpaper #4 ... "; eval "$wallpaper4" ;;
                 5) echo -n "set wallpaper #5 ... "; eval "$wallpaper5" ;;
             esac
             ;;
    esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
