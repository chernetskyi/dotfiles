# XDG Base Directory specification {{{
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg/"
# }}}

# Default programs {{{
export BROWSER=firefox-developer-edition
export MOZ_USE_XINPUT2=1
export EDITOR=nvim
export VISUAL=nvim
export PAGER="less -FfR"
export LESSHISTFILE=-
export SHELL=zsh
# }}}

# Home directory cleanup {{{
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# }}}

# vim:foldmethod=marker:foldlevel=0
