function fish_prompt
    set_color ff4ee0
    printf '['
    set_color 7e818b
    echo -n (date '+%Y-%m-%d ') # -n suppresses newline
    echo -n (date '+%H:%M:%S ')
    set_color purple
    printf '%s%s' (prompt_pwd) (fish_git_prompt)
    set_color ff4ee0
    printf '] '
    set_color normal
end

