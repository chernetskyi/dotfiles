if status is-interactive
    bind \cy        accept-autosuggestion
    bind \e\[45\;7u y repaint

    abbr --add a     aws
    abbr --add cp    cp -R
    abbr --add d     docker
    abbr --add dc    docker compose
    abbr --add dot   dotfiles
    abbr --add g     git
    abbr --add h     helm
    abbr --add k     kubectl
    abbr --add kd    kubectl describe
    abbr --add kg    kubectl get
    abbr --add kl    kubectl logs
    abbr --add kns   kubectl config set-context --current --namespace
    abbr --add kp    get pods
    abbr --add mkdir mkdir -p
    abbr --add p     python3
    abbr --add rm    rm -rf
    abbr --add tf    terraform
    abbr --add tfa   terraform apply
    abbr --add tfd   terraform-docs .
    abbr --add tff   terraform fmt
    abbr --add tfi   terraform init
    abbr --add tfl   tflint
    abbr --add tfp   terraform plan
    abbr --add tg    terragrunt
    abbr --add v     nvim
end
