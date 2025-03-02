function init_fish
    fish_config theme choose "tokyonight_night"

    set -U fish_greeting
    set -U fish_prompt_pwd_dir_length 5
    set -U hydro_cmd_duration_threshold 6000
    set -U hydro_multiline true
    set -U hydro_symbol_start \n
end
