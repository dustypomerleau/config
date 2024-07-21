return {
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                -- formatters = {
                --     rustfmt = {
                --         command = "leptosfmt",
                --         args = {
                --             "--stdin",
                --             "--rustfmt",
                --         },
                --     },
                -- },
                formatters_by_ft = {
                    -- `stop_after_first = true` runs only the first available formatter
                    css = { "prettier", },
                    javascript = { "prettier", },
                    json = { "prettier", },
                    jsonc = { "prettier", },
                    -- lua = {}, -- LSP uses EmmyLua, but it's not exactly clear how this is called (https://github.com/CppCXY/EmmyLuaCodeStyle).
                    markdown = { "prettier", },
                    nix = { "nixfmt", },
                    -- rust = { "rustfmt", },
                    sql = { "sqlfmt", },
                    svelte = { "prettier", },
                    toml = { "taplo", },
                    typescript = { "prettier", },
                },
                -- setting format_on_save will automatically generate an autocommand like:
                -- vim.api.nvim_create_autocmd("BufWritePre", {
                --     pattern = "*",
                --     callback = function(args)
                --         require("conform").format({ bufnr = args.buf })
                --     end,
                -- })
                -- fallback calls vim.lsp.buf.format() if nothing is specified
                format_on_save = { lsp_fallback = true, },
            })
        end,
    },
}
