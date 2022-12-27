#!/bin/sh

xrdb -merge < ~/.config/Xresources

xset r rate 300 20
setxkbmap -option caps:super

picom &
statusline &
exec dbus-run-session dwm
