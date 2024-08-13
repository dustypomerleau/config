return {
    {
        "pmizio/typescript-tools.nvim",
        enabled = false,
        event = "VeryLazy", -- load before BufEnter to help attach
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", },
        opts = {},
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("typescript-tools").setup({
                capabilities = capabilities,
                settings = {
                    tsserver_file_preferences = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        quotePreference = "double",
                    },
                },
            })
        end,
    },
}
