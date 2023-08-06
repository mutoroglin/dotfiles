#!/bin/bash

[[ -n $(hyprctl layers | grep "namespace: wofi") ]] && exit 0

INPUT=$(echo -e " REBOOT\n󰐥 POWER OFF\n LOCK\n󰗽 LOG OUT" | wofi --conf=/home/lee/.config/wofi/config_power)


case $INPUT in
   " LOCK")
       sleep 1
       gtklock
       ;;
   " REBOOT")
       sleep 1
       systemctl reboot
       ;;

   "󰐥 POWER OFF")
       sleep 1
       systemctl poweroff
       ;;
   "󰗽 LOG OUT")
       sleep1
       hyprctl dispatch exit
       ;;
esac
