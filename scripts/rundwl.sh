#!/bin/sh

SCRIPTS_DIR="$HOME/.local/bin/scripts"

export XDG_CURRENT_DESKTOP=wlroots
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=wlroots

exec dbus-run-session dwl -s $SCRIPTS_DIR/dwlstart
