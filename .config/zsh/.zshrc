# Helping functions {{{
exist () { command -v "$1" &> /dev/null }
sourcex () { source "${1}" 2> /dev/null || return 0 }
# }}}

# Launch tmux on startup {{{
if exist tmux && [[ -z "${TMUX}" ]]; then
  if ! tmux has-session -t startup 2> /dev/null; then
    tmux new-session -s startup -n main
  else
    tmux attach-session -t startup
  fi
fi
# }}}

# Powerlevel10k prompt {{{
sourcex /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
  && sourcex "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"
# }}}

# Plugins {{{
ZSH_PLUGIN_DIR="/usr/share/zsh/plugins"

sourcex "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  && export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("cd *") \
  && export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=() \
  && bindkey '^ ' autosuggest-accept

sourcex "${ZSH_PLUGIN_DIR}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
# }}}

# zsh options {{{
setopt autocd nobeep noextendedglob nohup nomatch nonotify
# }}}

# Completion {{{
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
zmodload zsh/complist
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}%B-- %d --%b%f'
compinit
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

bindkey "^[[A" up-line
bindkey "^[[B" down-line
# }}} 

# nnn {{{
exist nnn \
  && sourcex "${ZDOTDIR:-$HOME/.config/zsh}/nnn.zsh"
# }}}

# Aliases {{{
sourcex "${ZDOTDIR:-$HOME/.config/zsh}/alias.zsh"
# }}}

# vim:foldmethod=marker:foldlevel=0
