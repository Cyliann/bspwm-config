#
# ~/.bashrc
#


# Useful aliases
alias c='clear'
alias r='ranger'
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias grep='grep --color=auto'
alias gimme='sudo pacman -S'
alias yeet='paru -Rs'
alias maria-db='sudo /opt/lampp/bin/mysql -u root'
alias md='mkdir'
alias v='nvim'
alias cat='bat'
alias sudo='sudo '
alias music='~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'
alias tree='tree -C'
alias ls='colorls'
alias lsa='colorls -A'
alias lsl='colorls -l'
alias record='ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.00 ~/output.mp4'
alias his='history 1'
alias dot='cd .dotfiles'

# Set PATH so it includes user's private bin directories
set PATH "$HOME/.scripts:$PATH"
set PATH "$HOME/.local/bin:$PATH"


