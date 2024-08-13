-- for reference
-- https://github.com/Integralist/dotfiles/blob/a77a154b245e092084e4e1b9e06f365482c30e62/.config/nvim/lua/plugin-manager.lua#L169
-- see config options at https://github.com/williamboman/mason.nvim#configuration

return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {
            -- ensure Rust debugger is installed (codelldb)
            -- mapping from mason package names to lspconfig server names:
            -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
            ensure_installed = {
                "basedpyright",
                "clangd",
                "codelldb",
                "css-lsp",
                "html",
                "lua-language-server",
                "marksman",
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
