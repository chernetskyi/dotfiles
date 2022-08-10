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
alias f="firefox-developer-edition"
alias g="git"
alias h="helm"
alias k="kubectl"
alias l="exa --group-directories-first --icons"
alias la="l -la"
alias ll="l -l"
alias lt="l --tree"
alias p="python3"
alias tf="terraform"
alias tg="terragrunt"
alias v="nvim"
alias :q="exit"
alias :x="exit"
# }}}

# Dotfiles management {{{
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'
# }}}

# vim:foldmethod=marker:foldlevel=0
