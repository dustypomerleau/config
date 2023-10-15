return {
    {
        "pmizio/typescript-tools.nvim",
        event = "VeryLazy", -- similar strategy to rust-tools, load before BufEnter to help attach
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", },
        opts = {},
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("typescript-tools").setup({ capabilities = capabilities, })
        end,
    },
}
