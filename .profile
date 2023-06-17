# Startx Automatically
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &>/dev/null

if [ -n "$DESKTOP_SESSION" ]; then    #
	eval $(gnome-keyring-daemon --start) # Start gnome-keyring
	export SSH_AUTH_SOCK                 #
fi

# Set PATH so it includes user's private bin directories
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

export QT_QPA_PLATFORMTHEME=gtk3

# Reload pywal
(\cat ~/.cache/wal/sequences &)

# Keyboard layout
(xkbset st -twokey -latchlock &)
(setxkbmap -layout pl)
