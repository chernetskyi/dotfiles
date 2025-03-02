if status is-interactive
    bind \cy accept-autosuggestion
    bind \e\[45\;7u y repaint

    abbr --add a aws
    abbr --add d docker
    abbr --add dc docker compose
    abbr --add dot dotfiles
    abbr --add g git
    abbr --add h helm
    abbr --add k kubectl
    abbr --add p python3
    abbr --add tf terraform
    abbr --add tfd terraform-docs .
    abbr --add tfl tflint
    abbr --add tg terragrunt
    abbr --add v nvim

    abbr --add --command kubectl d describe
    abbr --add --command kubectl g get
    abbr --add --command kubectl l logs
    abbr --add --command kubectl ns config set-context --current --namespace
    abbr --add --command kubectl p get pods

    abbr --add --command terraform a apply
    abbr --add --command terraform f fmt
    abbr --add --command terraform i init
    abbr --add --command terraform p plan
end
