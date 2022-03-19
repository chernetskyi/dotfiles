exist () { command -v $1 &> /dev/null }

# Launch tmux on startup {{{
if exist tmux && [[ -z "${TMUX}" ]]; then
  if ! tmux has-session -t main 2> /dev/null; then
    tmux new-session -d -s main -n first
    tmux new-window  -d -t main -n second
  fi
  tmux attach-session -t main
fi
# }}}

# Powerlevel10k prompt {{{
[[ -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] \
  && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme \
  && source "${ZDOTDIR:-$HOME/.config/zsh}/.p10k.zsh"
# }}}

# Plugins {{{
ZSH_PLUGIN_DIR="/usr/share/zsh/plugins"

[[ -r "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
  && source "${ZSH_PLUGIN_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  && export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("cd *") \
  && export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=() \
  && bindkey '^ ' autosuggest-accept

[[ -r "${ZSH_PLUGIN_DIR}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ]] \
  && source "${ZSH_PLUGIN_DIR}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
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
exist nnn && source "${ZDOTDIR:-$HOME/.config/zsh}/nnn.zsh"
# }}}

# Aliases {{{
source "${ZDOTDIR:-$HOME/.config/zsh}/alias.zsh"
# }}}

# vim:foldmethod=marker:foldlevel=0
