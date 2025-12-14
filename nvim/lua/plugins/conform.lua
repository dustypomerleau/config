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
                    ["dockerfmt"] = { prepend_args = { "--indent=4" } },
                    -- The --experimental-cli flag is needed to use @prettier/plugin-oxc, but adding the flag --experimental-cli is breaking your custom prettier `tabWidth`
                    -- ["prettier"] = { prepend_args = { "--experimental-cli" } },
                    ["prettypst"] = {
                        prepend_args = { "--use-configuration", "--use-std-in", "--use-std-out" },
                    },
                    ["tex-fmt"] = { prepend_args = { "--tabsize", "4", "--wraplen", "100" } },
                },

                formatters_by_ft = {
                    -- rustfmt/leptosfmt configuration is per-project (see rustaceanvim.lua)
                    css = { "prettier" },
                    dockerfile = { "dockerfmt" },
                    javascript = { "oxfmt" },
                    json = { "prettier" },
                    jsonc = { "prettier" },
                    lua = { "stylua" }, -- LSP uses EmmyLua, but it's not exactly clear how this is called (https://github.com/CppCXY/EmmyLuaCodeStyle).
                    markdown = { "prettier" },
                    nix = { "nixfmt" },
                    python = { "ruff_format" },
                    sql = { "sqruff" },
                    svelte = { "prettier" },
                    svg = { "prettier" },
                    tex = { "tex-fmt", lsp_fallback = "never" },
                    toml = { "taplo" },
                    typescript = { "oxfmt" },
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
