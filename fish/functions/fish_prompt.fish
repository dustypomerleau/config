function fish_prompt
    set_color ff4ee0
    printf '['
    set_color 7e818b
    echo -n (date '+%Y-%m-%d ') # -n suppresses newline
    echo -n (date '+%H:%M:%S')
    printf '%s' (fish_git_prompt)
    set_color f5c68f
    printf ' %s' (prompt_pwd)
    set_color ff4ee0
    printf '] '
    set_color normal
end

