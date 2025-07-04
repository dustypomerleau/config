-- For troubleshooting, logfiles are located at: ~/.local/state/nvim/conform.log
return {
    {
        "stevearc/conform.nvim",
        version = false,
        -- enabled = false, -- toggle if you need to turn formatting off for some reason
        event = "VeryLazy",

        config = function()
            require("conform").setup({
                formatters = {
                    ["prettypst"] = {
                        prepend_args = { "--use-configuration", "--use-std-in", "--use-std-out" },
                    },
                    ["tex-fmt"] = { prepend_args = { "--tabsize", "4", "--wraplen", "100" } },
                },

                formatters_by_ft = {
                    -- rustfmt/leptosfmt configuration is per-project (see rustaceanvim.lua)
                    css = { "prettierd", "prettier", stop_after_first = true },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    json = { "prettierd", "prettier", stop_after_first = true },
                    jsonc = { "prettierd", "prettier", stop_after_first = true },
                    lua = { "stylua" }, -- LSP uses EmmyLua, but it's not exactly clear how this is called (https://github.com/CppCXY/EmmyLuaCodeStyle).
                    markdown = { "prettierd", "prettier", stop_after_first = true },
                    nix = { "nixfmt" },
                    svelte = { "prettierd", "prettier", stop_after_first = true },
                    tex = { "tex-fmt", lsp_fallback = "never" },
                    toml = { "taplo" },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
                    typst = { "prettypst", "typstyle", stop_after_first = true },
                    yaml = { "yamlfmt" },
                },

                -- setting format_on_save will automatically generate an autocommand like:
                -- vim.api.nvim_create_autocmd("BufWritePre", {
                --     pattern = "*",
                --     callback = function(args) require("conform").format({ bufnr = args.buf }) end,
                -- }),
                -- fallback calls vim.lsp.buf.format() if nothing is specified
                format_on_save = {
                    lsp_format = "fallback",
                    -- setting a long timeout helps prevent failure on the first invocation after
                    -- BufEnter (subsequent invocations are usually fast).
                    timeout_ms = 2000,
                },
            })
        end,

        keys = {
            {
                "<localleader>f",
                "<cmd>ConformInfo<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
