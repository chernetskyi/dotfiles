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
  && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh" ]] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh"
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

# Plugins {{{
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
  && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  && export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("cd *") \
  && export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=() \
  && bindkey '^ ' autosuggest-accept

[[ -r /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] \
  && source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
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

# Change default behavior with flags {{{
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -rf"
alias scp="scp -r"
alias sudo="sudo"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
# }}}

# Shorten commands {{{
alias d="docker"
alias dc="docker-compose"
alias f="firefox"
alias g="git"
alias h="helm"
alias k="kubectl"
alias tf="terraform"
alias tg="terragrunt"
alias v="nvim"
# }}}

# Overwrite commands {{{
exist ag        && alias ack="ag"
exist bat       && alias cat="bat -pp --theme Nord"
exist curlie    && alias curl="curlie"
exist dog       && alias dig="dog"
exist exa       && alias ls="exa --group-directories-first --icons" \
                && alias tree="ls --tree"
exist fd        && alias find="fd"
exist sd        && alias sed="sd"
exist rg        && alias grep="rg"
# }}}

# Dotfiles management {{{
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'
# }}}

# vim:foldmethod=marker:foldlevel=0
