#!/bin/bash

#echo $1

pkill show_panel.sh

case $1 in
    volume) show_panel.sh volume &
            ;;
    brightness)
            show_panel.sh brightness &
            ;;
    mic)    show_panel.sh mic &
            ;;
    *) ;;
esac
