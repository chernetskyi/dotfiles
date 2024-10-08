# Change default behavior with flags
alias cp="cp -R"
alias mkdir="mkdir -p"
alias rg="rg --hidden --glob='!.git/*' --no-config"
alias rm="rm -rf"
alias scp="scp -r"
alias sudo="sudo"
alias wget='wget --hsts-file="${XDG_CACHE_HOME:-$HOME/.local/share}/wget-hsts"'

# Change default behavior with environment variables
export TF_CLI_ARGS_fmt="-recursive"

# Shorten commands
alias a="aws"
alias cdg='git rev-parse --is-inside-work-tree &> /dev/null && cd $(git rev-parse --show-toplevel)'
alias d="docker"
alias dc="docker compose"
alias f="firefox-developer-edition"
alias g="git"
alias h="helm"
alias k="kubectl"
alias l="eza --group-directories-first --classify=auto"
alias la="l -la"
alias ll="l -l"
alias lt="l --tree"
alias p="python"
alias p3="python3"
alias tf="terraform"
alias tfd="terraform-docs ."
alias tfl="tflint"
alias tg="terragrunt"
alias v="nvim"
alias vc="nvim --clean --cmd 'set nu | set rnu'"

# Dotfiles management
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'
