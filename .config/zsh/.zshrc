# Helping functions {{{
exist () { command -v "${1}" &> /dev/null }
sourcex () { source "${1}" 2> /dev/null || return 0 }
# }}}

# Powerlevel10k prompt {{{
sourcex /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
  && sourcex "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"
# }}}

# Plugins {{{
sourcex "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  && export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("cd *") \
  && export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=() \
  && bindkey '^ ' autosuggest-accept
# }}}

# zsh options {{{
setopt autocd nobeep noextendedglob nohup nomatch nonotify
# }}}

# Completion {{{
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
zmodload zsh/complist
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}%B%d:%b%f'
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"
_comp_options+=(globdots)
# }}}

# History {{{
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory histfindnodups histignorespace histignoredups histreduceblanks
# }}}

# Vi mode {{{
bindkey -v
export KEYTIMEOUT=1

bindkey -v "^?" backward-delete-char
bindkey -v "\e[3~" delete-char
bindkey -v "^[[1~" beginning-of-line
bindkey -v "^[[4~" end-of-line
# }}}

# nnn {{{
exist nnn && sourcex "${XDG_CONFIG_HOME:-$HOME/.config}/nnn/nnn.zsh"
# }}}

# Aliases {{{
sourcex "${ZDOTDIR:-$HOME/.config/zsh}/alias.zsh"
# }}}

# vim:foldmethod=marker:foldlevel=0
