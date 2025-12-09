#!/bin/sh

WALLPAPER="$HOME/dotfiles/images/wallpaper.jpg"

waybar &
swaybg -i ~/dotfiles/images/wallpaper.jpg &

ibus-daemon -rxRd

swayidle -w \
    timeout 300 'for o in $(wlopm); do wlopm --off $o; done' \
    resume 'for o in $(wlopm); do wlopm --on $o; done' \
    timeout 900 'systemctl suspend' \
    before-sleep "swaylock -f -i $WALLPAPER -s fill --font monospace --font-size 20 --indicator-idle-visible --ignore-empty-password --show-failed-attempts --indicator-radius 80 --indicator-thickness 8" &
