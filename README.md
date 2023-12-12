# dotfiles
This repository contains the configuration and script files of my arch/hyprland setup.

## motivation
Using hyprland is an experiment to
 * try out a tiling window manager
 * optimize my workflow
 * touch base with into the internals of a desktop environment and the linux desktop

## setup
 * [arch linux](https://archlinux.org/)
 * [hyprland](https://github.com/hyprwm/Hyprland) (window manager)
 * [sddm](https://github.com/sddm/sddm) (logon manager)
 * [hyprpaper]() (wallpaper)
 * [dunst](https://github.com/dunst-project/dunst) (notification daemon)
 * [waybar](https://github.com/Alexays/Waybar) (main bar on top of screen)
 * [eww](https://github.com/elkowar/eww) (widgets on sound brightness changes)
 * [wofi](https://hg.sr.ht/~scoopta/wofi) (launcher, session dialog)
 * [udiskie](https://github.com/coldfix/udiskie) (manage removable devices)
 * [iwgtk](https://github.com/J-Lentz/iwgtk) (Lightweight wireless networking GUI)
 * [grim](https://github.com/emersion/grim) (screenshots)

<img src="https://github.com/mutoroglin/dotfiles/blob/main/Pictures/screenshots/system_info.png" height="auto" width="auto"/>

## waybar highlights
Waybar is a customizable status bar. The elements displayed, so called widgets, are define in a config file. The look is set with a separate css file.

On the left-hand side I display the power button (well spotted, I use ARCH), the workspace overview, the taskbar and the tray.
On the right-hand side I display all kind of status icons and my system clock.
A highlight is the [CAVA](https://aur.archlinux.org/packages/cava) module, an audio visualizer. It unwraps next to the volume icon as audio is played.

<img src="https://github.com/mutoroglin/dotfiles/blob/main/Pictures/screenshots/waybar_cava_in_motion.png" height="auto" width="auto"/>

In order to easily install waybar with cava functionality I setup and maintain two AUR packages (for the ARCH ecosystem):
 * [libcava](https://aur.archlinux.org/packages/libcava)
 * [waybar-cava](https://aur.archlinux.org/packages/waybar-cava]waybar-cava)
