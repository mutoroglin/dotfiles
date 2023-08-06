#!/bin/bash

[[ -n $(hyprctl layers | grep "namespace: wofi") ]] && exit 0

wofi --conf=/home/lee/.config/wofi/config
