return {
    {
        -- "simrat39/rust-tools.nvim", -- try the fork below, but keep this in case
        -- see discussion on reddit https://www.reddit.com/r/neovim/comments/13rbam2/forking_of_rusttoolsnvim/
        "ciel-mc/rust-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            -- debug
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        event = "VeryLazy", -- loading on ft = "rust" does not cause server to attach
        config = function()
            local rt = require("rust-tools")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            rt.setup({
                server = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = { features = "all", },
                            workspace = { symbol = { search = { kind = "all_symbols", }, }, },
                        },
                    },
                    capabilities = capabilities,
                    -- Removed this on_attach, because inlay hints are handled for all compatible
                    -- LSP servers using the autocmd on LspAttach in lspconfig.lua.
                    -- on_attach = function(_, bufnr)
                    --     vim.lsp.inlay_hint.enable(bufnr, true)
                    -- end,
                },
            })
        end,
    },
}

-- resources:
-- https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples#rust-with-rust-toolsnvim
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
