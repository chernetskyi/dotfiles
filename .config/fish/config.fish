if status is-interactive
    bind \cy accept-autosuggestion
    bind \e\[45\;7u y

    abbr -a a aws
    abbr -a d docker
    abbr -a dc docker compose
    abbr -a g git
    abbr -a h helm
    abbr -a k kubectl
    abbr -a kg kubectl get
    abbr -a kl kubectl logs
    abbr -a p python3
    abbr -a tf terraform
    abbr -a tfd terraform-docs .
    abbr -a tfl tflint
    abbr -a tg terragrunt
    abbr -a v nvim
end
