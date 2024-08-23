eval "$(atuin init zsh)"
HISTFILE=""

setopt APPEND_HISTORY \
       AUTO_PARAM_SLASH \
       HIST_FIND_NO_DUPS \
       HIST_IGNORE_DUPS \
       HIST_IGNORE_SPACE \
       HIST_REDUCE_BLANKS \
       LIST_PACKED \
       NOMATCH \
       NO_BEEP \
       NO_EXTENDED_GLOB \
       NO_HUP


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
  && source "${ZDOTDIR:-$HOME/.config/zsh}/p10k.zsh"


# completion
fpath=(/usr/share/zsh/site-functions $fpath)

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"

# complete hidden files
_comp_options+=(globdots)

# enable *. extension completion
zstyle ':completion:*' completer _extensions _complete

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# group results under descriptions
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}%B%d%b%f'
zstyle ':completion:*:*:*:*:messages' format '%F{yellow}%B%d%b%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{red}%Bno matches found%b%f'

zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' squeeze-slashes true

# complete cd options for -
zstyle ':completion:*' complete-options true

# ignore case when there are no uppercase characters
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'


bindkey -A emacs main
bindkey -e "\e[3~" delete-char
bindkey -e "^[[H" beginning-of-line
bindkey -e "^[[F" end-of-line
bindkey -e "^[[1;5D" backward-word
bindkey -e "^[[1;5C" forward-word

# editing the command line in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -e '^e' edit-command-line


source "${XDG_CONFIG_HOME:-$HOME/.config}/yazi/yazi.zsh"
source "${ZDOTDIR:-$HOME/.config/zsh}/alias.zsh"
