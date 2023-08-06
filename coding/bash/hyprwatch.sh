#!/bin/bash

######################################
# HYPRWATCH
# version: 1.0
# author: mutoroglin@posteo.org
# license: GPLv3
######################################

wallpaper1='hyprctl hyprpaper wallpaper "eDP-1,~/Pictures/wallpaper/la_rotonde_1920x1080.png"'
wallpaper2='hyprctl hyprpaper wallpaper "eDP-1,~/Pictures/wallpaper/inside2_not_rotonde_1920x1080.png"'
wallpaper3='hyprctl hyprpaper wallpaper "eDP-1,~/Pictures/wallpaper/kitchen2_not_rotonde_1920x1080.png"'
wallpaper4='hyprctl hyprpaper wallpaper "eDP-1,~/Pictures/wallpaper/back-alley2_not_rotonde_1920x1080.png"'

handle() {
    case $1 in
        workspace*)
             case ${1:11:1} in
                 1) echo -n "set wallpaper #1 ... "; eval "$wallpaper1" ;;
                 2) echo -n "set wallpaper #2 ... "; eval "$wallpaper2" ;;
                 3) echo -n "set wallpaper #3 ... "; eval "$wallpaper3" ;;
                 4) echo -n "set wallpaper #4 ... "; eval "$wallpaper4" ;;
             esac
             ;;
    esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done