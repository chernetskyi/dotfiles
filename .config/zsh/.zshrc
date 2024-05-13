exist () { command -v "${1}" &> /dev/null }
sourcex () { source "${1}" || return 0 }

eval "$(atuin init zsh)"
setopt appendhistory histfindnodups histignorespace histignoredups histreduceblanks
HISTFILE=""

sourcex /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
  && sourcex "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"

setopt autocd nobeep noextendedglob nohup nomatch nonotify

# Completion
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' complete-options true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:corrections' format '%F{green}%B%d (%e errors):%b%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}%B%d:%b%f'
zstyle ':completion:*:messages' format '%F{yellow}%B%d:%b%f'
zstyle ':completion:*:warnings' format '%F{red}%Bno matches found%b%f'
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"
_comp_options+=(globdots)

# Vi mode {{{
bindkey -A viins main
export KEYTIMEOUT=1

# insert mode keybinding fixes
bindkey -v "^?" backward-delete-char
bindkey -v "\e[3~" delete-char
bindkey -v "^[[1~" beginning-of-line
bindkey -v "^[[4~" end-of-line
bindkey -v "^[[1;5D" backward-word
bindkey -v "^[[1;5C" forward-word

# editing the command line in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line
# }}}

sourcex "${XDG_CONFIG_HOME:-$HOME/.config}/lf/lf.zsh"
sourcex "${ZDOTDIR:-$HOME/.config/zsh}/alias.zsh"
