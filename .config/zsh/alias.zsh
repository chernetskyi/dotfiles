# Change default behavior with flags {{{
alias cal="cal -m"
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -rf"
alias scp="scp -r"
alias sudo="sudo "
alias wget='wget --hsts-file="${XDG_CACHE_HOME:-$HOME/.local/share}/wget-hsts"'
# }}}

# Shorten commands {{{
alias d="docker"
alias dc="docker-compose"
alias f="firefox"
alias g="git"
alias h="helm"
alias k="kubectl"
alias l="ls"
alias tf="terraform"
alias tg="terragrunt"
alias v="nvim"
alias :q="exit"
alias :x="exit"
# }}}

# Overwrite commands {{{
exist bat    && alias cat="bat"
exist curlie && alias curl="curlie"
exist dog    && alias dig="dog"
exist exa    && alias ls="exa --group-directories-first --icons" \
             && alias tree="ls --tree"
exist fd     && alias find="fd"
exist sd     && alias sed="sd"
exist rg     && alias grep="rg"
# }}}

# Dotfiles management {{{
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'
# }}}

# vim:foldmethod=marker:foldlevel=0
