function rg
    command rg --hidden --glob='!**/.git/*' --no-config $argv
end
