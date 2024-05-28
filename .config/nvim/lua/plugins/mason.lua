-- for reference
-- https://github.com/Integralist/dotfiles/blob/a77a154b245e092084e4e1b9e06f365482c30e62/.config/nvim/lua/plugin-manager.lua#L169
-- see config options at https://github.com/williamboman/mason.nvim#configuration

return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {
            -- ensure Rust debugger is installed (codelldb)
            ensure_installed = {
                "clangd",
                "codelldb",
                "lua-language-server",
                "marksman",
                "pyright",
                "rust-analyzer",
                "sqlfmt",
                "svelte-language-server",
                "tailwindcss-language-server",
                "taplo",
                "typst-lsp",
                "vtsls",
            },
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
}
