return {
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    -- using a sublist will run only the first available formatter
                    -- my impression is that it's best to lean on vim.lsp.buf.format()
                    -- from init.vim, but if it's not giving the desired result, like
                    -- typescript, then add it here
                    javascript = { { "prettierd", "prettier", }, },
                    -- lua = {}, -- LSP uses EmmyLua, but it's not exactly clear how this is called (https://github.com/CppCXY/EmmyLuaCodeStyle).
                    markdown = { { "prettierd", "prettier", }, },
                    -- rust = { "rustfmt", },
                    -- svelte = { { "prettierd", "prettier", }, },
                    typescript = { { "prettierd", "prettier", }, },
                },
                -- setting format_on_save will automatically generate an autocommand like:
                -- vim.api.nvim_create_autocmd("BufWritePre", {
                --     pattern = "*",
                --     callback = function(args)
                --         require("conform").format({ bufnr = args.buf })
                --     end,
                -- })
                format_on_save = { lsp_fallback = true, },
            })
        end,
    },
}
