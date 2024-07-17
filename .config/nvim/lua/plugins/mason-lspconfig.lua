return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "marksman",
                    "pyright", -- todo: replace with basedpyright
                    "rust_analyzer",
                    "svelte",
                    "tailwindcss",
                    "tsserver",
                },
            })
        end,
    },
}
