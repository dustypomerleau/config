vim.g.nvim_surround_no_mappings = true

return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "BufEnter",

        keys = {
            {
                "co",
                "<Plug>(nvim-surround-change)",
                mode = { "n" },
                silent = true,
            },
            {
                "cO",
                "<Plug>(nvim-surround-change-line)",
                mode = { "n" },
                silent = true,
            },
            {
                "do",
                "<Plug>(nvim-surround-delete)",
                mode = { "n" },
                silent = true,
            },
            {
                "<C-g>o",
                "<Plug>(nvim-surround-insert)",
                mode = { "i" },
                silent = true,
            },
            {
                "<C-g>O",
                "<Plug>(nvim-surround-insert-line)",
                mode = { "i" },
                silent = true,
            },
            {
                "yo",
                "<Plug>(nvim-surround-normal)",
                mode = { "n" },
                silent = true,
            },
            {
                "yoo",
                "<Plug>(nvim-surround-normal-cur)",
                mode = { "n" },
                silent = true,
            },
            {
                "yOO",
                "<Plug>(nvim-surround-normal-cur-line)",
                mode = { "n" },
                silent = true,
            },
            {
                "yO",
                "<Plug>(nvim-surround-normal-line)",
                mode = { "n" },
                silent = true,
            },
            {
                "O",
                "<Plug>(nvim-surround-visual)",
                mode = { "x" },
                silent = true,
            },
            {
                "gO",
                "<Plug>(nvim-surround-visual-line)",
                mode = { "x" },
                silent = true,
            },
        },
    },
}
