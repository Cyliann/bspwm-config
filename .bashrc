#
# ~/.bashrc
#

# Env variables
export EDITOR=nvim
export PATH="$PATH:$HOME/.scripts/:$HOME/.local/share/cargo/bin/"

# Useful aliases
alias c='clear'
alias r='ranger'
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias grep='grep --color=auto'
alias gimme='paru -S'
alias yeet='paru -Rns'
alias maria-db='sudo /opt/lampp/bin/mysql -u root'
alias md='mkdir -p'
alias v='neovide'
alias cat='bat'
alias tree='tree -C'
alias ls='colorls'
alias lsa='colorls -A'
alias lsl='colorls -l'
alias record='ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.00 ~/output.mp4'
alias his='history 1 | fzf'
alias dot='cd .dotfiles'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
alias ffmpeg='ffmpeg -hide_banner'
alias cd='z'
alias cdi='zi'
