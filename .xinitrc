#!/bin/sh

xset r rate 300 20
setxkbmap -option caps:super

picom &
exec dbus-run-session dwm
