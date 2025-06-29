function postexec --on-event fish_postexec
    set --global _prompt_duration

    if test $CMD_DURATION -gt 6000
        set --local secs (math --scale=0 $CMD_DURATION/1000 % 60)
        set --local mins (math --scale=0 $CMD_DURATION/60000 % 60)
        set --local hours (math --scale=0 $CMD_DURATION/3600000)

        test $hours -gt 0 && set --global --append _prompt_duration $hours'h'
        test $mins -gt 0 && set --global --append _prompt_duration $mins'm'
        test $secs -gt 0 && set --global --append _prompt_duration $secs's'
    end
end
