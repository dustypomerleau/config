return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local lsp = require("lspconfig")

        lsp.clangd.setup({})

        lsp.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                },
            },
        })

        -- todo:
        lsp.rust_analyzer.setup({})
        lsp.svelte.setup({})
        lsp.tailwindcss.setup({})
        lsp.tsserver.setup({})
    end,
}
