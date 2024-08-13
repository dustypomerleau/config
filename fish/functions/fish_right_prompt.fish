function fish_right_prompt
    set_color ff4ee0
    printf '['
    set_color 7e818b
    echo -n (date '+%Y-%m-%d ') # -n suppresses newline
    set_color blue
    echo -n (date '+%H:%M:%S')
    set_color ff4ee0
    printf '] '
    set_color normal
end
