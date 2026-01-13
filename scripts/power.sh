#!/bin/sh

menu=$'󰜉 Reboot\n󰤄 Suspend\n Shutdown'

prompt() {
    rofi -dmenu -i -p "$1" -theme-str 'window { width: 320px; } listview { lines: 3; }' <<< "$2"
}

confirm() {
    choice="$(prompt "$1 — are you sure?" $'Yes\nNo')"
    [[ "$choice" == "Yes" ]]
}
handle_confirm() {
    if confirm "$1"; then 
        eval "$2"
    fi
}

choice="$(prompt "" "$menu")"
choice="${choice##* }"
choice="${choice,,}"

case "$choice" in 
    "reboot")   handle_confirm "Reboot" "systemctl reboot" ;;
    "suspend")  handle_confirm "Suspend" "systemctl suspend" ;;
    "shutdown") handle_confirm "Shutdown" "systemctl poweroff" ;;
    *) exit 0 ;;
esac
