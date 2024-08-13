return {
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                diagnostics = { -- use `s` to cycle the filter
                    win = { size = 0.6, },
                    preview = { -- use `p` to toggle preview
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.5,
                    },
                },
            },
            focus = true,
            warn_no_results = false,
            open_no_results = true,
        },
        keys = {
            {
                "<leader>d",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Toggle buffer diagnostics",
                { noremap = true, },
            },
            {
                "<localleader>d",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Toggle workspace diagnostics",
                { noremap = true, },
            },
        },
    },
}
