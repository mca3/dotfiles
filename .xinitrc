#!/bin/sh

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

xrdb -merge < ~/.config/Xresources

xset r rate 300 20 &
setxkbmap -option caps:super &

runsvdir ~/.local/etc/sv &

# Need to cleanup runit before we're done.
dbus-run-session dwm

usv force-stop ~/.local/etc/sv/*
usv exit ~/.local/etc/sv/*
