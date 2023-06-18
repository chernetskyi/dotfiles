exist () { command -v "${1}" &> /dev/null }
sourcex () { source "${1}" || return 0 }

sourcex /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
  && sourcex "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"

sourcex "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  && export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("cd *") \
  && export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=() \
  && bindkey '^ ' autosuggest-accept

setopt autocd nobeep noextendedglob nohup nomatch nonotify

HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory histfindnodups histignorespace histignoredups histreduceblanks

# Completion {{{
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
# }}}

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

# completion menu navigation
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# add brackets and quotes as text objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# editing the command line in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line
# }}}

sourcex "${XDG_CONFIG_HOME:-$HOME/.config}/lf/lf.zsh"
sourcex "${ZDOTDIR:-$HOME/.config/zsh}/alias.zsh"

# vim:foldmethod=marker:foldlevel=0
