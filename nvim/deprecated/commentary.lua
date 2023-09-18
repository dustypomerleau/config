return {
    {
        "tpope/vim-commentary",
        event = "VeryLazy",
        init = function()
            vim.api.nvim_create_autocmd(
                { "Filetype", }, {
                    pattern = "edgeql",
                    command = [[setlocal commentstring=#\ %s]],
                }
            )
            vim.api.nvim_create_autocmd(
                { "Filetype", }, {
                    pattern = "json",
                    command = [[setlocal commentstring=//\ %s]],
                }
            )
            vim.api.nvim_create_autocmd(
                { "Filetype", }, {
                    pattern = "latex",
                    command = [[setlocal commentstring=%\ %s]],
                }
            )
            vim.api.nvim_create_autocmd(
                { "Filetype", }, {
                    pattern = "svelte",
                    command = [[setlocal commentstring=<!--\ %s\ -->]],
                }
            )
        end,
    },
}
