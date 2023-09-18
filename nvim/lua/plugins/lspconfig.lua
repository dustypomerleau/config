-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

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

        lsp.marksman.setup({}) -- use rust-tools for config
        lsp.rust_analyzer.setup({}) -- use rust-tools for config
        lsp.svelte.setup({})
        lsp.tailwindcss.setup({})
        lsp.tsserver.setup({})

        -- require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
}
