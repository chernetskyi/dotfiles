function fish_prompt
    set --local last_status $pipestatus
    set --function prompt_status

    for code in $last_status
        if test $code -ne 0
            set --function prompt_status (set_color $fist_color_error)(string join '|' $last_status)(set_color normal)
            break
        end
    end

    set --local prompt_dir (set_color $fish_color_option)(prompt_pwd --dir-length=0)(set_color normal)
    set --local prompt_duration (set_color $fish_color_quote)$_prompt_duration(set_color normal)

    set --global __fish_git_prompt_showdirtystate true
    set --local prompt_git (fish_git_prompt '%s')

    printf '\n%s %s %s %s\n> ' $prompt_dir $prompt_git $prompt_duration $prompt_status
end
