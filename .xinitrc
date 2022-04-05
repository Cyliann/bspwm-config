#!/bin/bash

#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -layout pl &

# Start gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh) &
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg) &
dbus-update-activation-environment --systemd DISPLAY &
export SSH_AUTH_SOCK &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

easyeffects --gapplication-service &

# Fix Pycharm grey screen
export _JAVA_AWT_WM_NONREPARENTING=1

exec bspwm

