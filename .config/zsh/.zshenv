export ZDOTDIR="$HOME"/.config/zsh

# IM config
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# From xdg-ninja
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZDOTDIR="$HOME"/.config/zsh

# fcitx support in terminal
export GLFW_IM_MODULE=ibus

# Golang
export GOPATH=$HOME/.local/share/go
