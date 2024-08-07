return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-lspconfig").setup({
                -- mapping from mason package names to lspconfig server names:
                -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
                ensure_installed = {
                    "basedpyright",
                    "clangd",
                    "cssls",
                    "html",
                    "lua_ls",
                    "marksman",
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
