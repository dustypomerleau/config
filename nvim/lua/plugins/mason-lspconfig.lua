return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-lspconfig").setup({
                -- Note: names here will not match names in mason.lua
                -- Mapping from mason package names to lspconfig server names:
                -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
                ensure_installed = {
                    "basedpyright",
                    "clangd",
                    "cssls",
                    "html",
                    "lua_ls",
                    "marksman",
                    "nil_ls",
                    "rust_analyzer",
                    "svelte",
                    "tailwindcss",
                    "taplo",
                    "typst_lsp",
                    "vtsls",
                },
            })
        end,
    },
}
