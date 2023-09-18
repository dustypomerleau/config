return {
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            height = 0.95,
                            width = 0.99,
                        },
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>t",
                ":Telescope<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>b",
                ":Telescope buffers<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>f",
                ":Telescope live_grep<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>g",
                ":Telescope git_files<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>h",
                ":Telescope oldfiles<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>l",
                ":Telescope current_buffer_fuzzy_find<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>m",
                ":Telescope lsp_workspace_symbols<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>p",
                ":Telescope find_files<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>r",
                ":Telescope registers<cr>",
                mode = { "n", },
                noremap = true,
            },
        },
    },
}
