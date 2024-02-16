function fish_prompt
    set_color ff4ee0
    printf '['
    set_color magenta
    printf '%s%s' (prompt_pwd) (fish_git_prompt)
    set_color ff4ee0
    printf '] '
    set_color normal
end

