-- default server configs for reference:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    -- you may be able to setup inlay hints natively here, rather than in rust-tools, for example
    -- (inlay support added in nvim 10+)
}
