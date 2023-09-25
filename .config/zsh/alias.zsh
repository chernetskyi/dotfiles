# Change default behavior with flags
alias cal="cal -m"
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -rf"
alias scp="scp -r"
alias sudo="sudo "
alias wget='wget --hsts-file="${XDG_CACHE_HOME:-$HOME/.local/share}/wget-hsts"'

# Shorten commands
alias cdg='git rev-parse --is-inside-work-tree &> /dev/null && cd $(git rev-parse --show-toplevel)'
alias d="docker"
alias dc="docker compose"
alias f="firefox-developer-edition"
alias g="git"
alias h="helm"
alias k="kubectl"
alias l="eza --group-directories-first --icons"
alias la="l -la"
alias ll="l -l"
alias lt="l --tree"
alias p="python3"
alias tf="terraform"
alias tg="terragrunt"
alias vc="nvim --clean"

v ()
{
  if [ -S /tmp/neovim.pipe ]; then
    readlink -f "${@}" | xargs nvim --server /tmp/neovim.pipe --remote
  else
    nvim --listen /tmp/neovim.pipe "${@}"
  fi
}

# Dotfiles management
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'

# vim:foldmethod=marker:foldlevel=0
