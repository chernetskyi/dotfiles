function xv
    rg -l $argv[1] | xargs nvim -c "/$argv[1]"
end
