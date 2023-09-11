return {
    {
        "neoclide/coc.nvim",
        branch = "release",
        config = function()
            vim.api.nvim_create_user_command(
                "Prettier",
                ":call CocAction('runCommand', 'prettier.formatFile')",
                { nargs = 0, }
            )
        end,
        keys = {
            {
                "<leader>d",
                "<cmd>CocDiagnostics<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>v",
                "<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "gd",
                function() require("coc.nvim").cmd("coc-definition") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gf",
                function() require("coc.nvim").cmd("coc-float-jump") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gd",
                function() require("coc.nvim").cmd("coc-definition") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gd",
                function() require("coc.nvim").cmd("coc-definition") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },

        },
    },
}
