return {
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    -- using a sublist will run only the first available formatter
                    -- if fallback calling vim.lsp.buf.format() works as desired, no need to add the
                    -- language here - but these are cases where i want to be more specific
                    css = { { "prettierd", "prettier", }, },
                    javascript = { { "prettierd", "prettier", }, },
                    json = { { "prettierd", "prettier", }, },
                    jsonc = { { "prettierd", "prettier", }, },
                    -- lua = {}, -- LSP uses EmmyLua, but it's not exactly clear how this is called (https://github.com/CppCXY/EmmyLuaCodeStyle).
                    markdown = { { "prettierd", "prettier", }, },
                    nix = { { "nixfmt", }, },
                    -- rust = { "rustfmt", },
                    svelte = { { "prettierd", "prettier", }, },
                    toml = { { "taplo", }, },
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
