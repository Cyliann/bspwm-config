#!/bin/sh
"$HOME/.config/ranger/scope.sh" "${1}" "${2}" "${3}" "" "" || true

if [[ "$filetype" =~ ^image ]]; then
	kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file" </dev/null >/dev/tty
	exit 1
fi

if [[ "$filetype" =~ ^video ]]; then
	# vidthumb is from here:
	# https://raw.githubusercontent.com/duganchen/kitty-pistol-previewer/main/vidthumb
	kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$(vidthumb "$file")" </dev/null >/dev/tty
	exit 1
fi
