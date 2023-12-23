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
                },
                tools = {
                    -- disable rust-tools inlay hints to avoid deprecation warning
                    -- native inlay hints are set up for all servers in lspconfig.lua
                    inlay_hints = { auto = false, },
                    -- disable on_type_formatting, as this throws a wicked error on every keystroke
                    -- perhaps revisit once there has been opportunity to troubleshoot
                    -- https://github.com/Ciel-MC/rust-tools.nvim/blob/1d005b37a6b7c216764b044573a440ff9f6f0821/lua/rust-tools/on_type_formatting.lua#L21
                    on_type_formatting = false,
                },
            })
        end,
    },
}

-- resources:
-- https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples#rust-with-rust-toolsnvim
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
