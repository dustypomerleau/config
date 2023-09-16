-- todo:
return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                -- "html",
                -- "jsonls",
                -- ltex, texlab
                "lua_ls",
                -- "marksman",
                -- "pyright",
                "rust_analyzer",
                "svelte",
                "tailwindcss",
                "tsserver",
            },
        })
    end,
}
