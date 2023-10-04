-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    -- temporarily move to not calling setup here
    -- because these calls to setup are redundant if you also call setup
    -- in cmp.lua
    --
    -- config = function()
    --     local lsp = require("lspconfig")
    --
    --     lsp.clangd.setup({})
    --
    --     lsp.lua_ls.setup({
    --         settings = {
    --             Lua = {
    --                 runtime = {
    --                     version = "LuaJIT",
    --                 },
    --             },
    --         },
    --     })
    --
    --     lsp.marksman.setup({})
    --     lsp.rust_analyzer.setup({}) -- use rust-tools for config
    --     lsp.svelte.setup({})
    --     lsp.tailwindcss.setup({})
    --     -- setup for tsserver removed, as this is now handled by typescript-tools
    -- end,
}
