#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

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

# Borrowed from /etc/X11/xinit/xinitrc
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Keyboard layout
setxkbmap -layout pl &
xkbset sticky -twokey -latchlock & # set sticky keys

# Start window manager
exec bspwm
