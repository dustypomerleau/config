return {
    {
        "kylechui/nvim-surround",
        event = "BufEnter",
        config = function()
            -- avoid conflicts with flash by changing sS to oO
            require("nvim-surround").setup({
                keymaps = {
                    change = "co",
                    change_line = "cO",
                    delete = "do",
                    insert = "<C-g>o",
                    insert_line = "<C-g>O",
                    normal = "yo",
                    normal_cur = "yoo",
                    normal_cur_line = "yOO",
                    normal_line = "yO",
                    visual = "O",
                    visual_line = "gO",
                },
            })
        end,
    },
}
