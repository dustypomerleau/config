return {
    {
        "yioneko/nvim-vtsls",
        version = false,

        config = function()
            local configs = require("lspconfig.configs")
            local lsp = require("lspconfig")

            -- set default server config
            configs.vtsls = require("vtsls").lspconfig

            -- customization
            lsp.vtsls.setup({
                settings = {
                    typescript = {
                        inlayHints = {
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = true },
                            variableTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            enumMemberValues = { enabled = true },
                        },
                    },
                },
            })
        end,
    },
}
