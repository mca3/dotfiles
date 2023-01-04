#!/bin/sh

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

xrdb -merge < ~/.config/Xresources

xset r rate 300 20
setxkbmap -option caps:super

picom &
statusline &

pipewire &
wireplumber &
pipewire-pulse &

exec dbus-run-session dwm
