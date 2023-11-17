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
                    settings = { ["rust-analyzer"] = { cargo = { allFeatures = true, }, }, },
                    -- Comment out this function, as you provide both hover and code
                    -- actions generically in keys.lua (for all LSs).
                    -- on_attach = function(_, bufnr)
                    --     -- Hover actions
                    --     vim.keymap.set("n", "<localleader>h", rt.hover_actions.hover_actions,
                    --         { buffer = bufnr, })
                    --     -- Code action groups
                    --     vim.keymap.set("n", "<localleader>a", rt.code_action_group.code_action_group,
                    --         { buffer = bufnr, })
                    -- end,
                    capabilities = capabilities,
                },
                tools = {
                    inlay_hints = {
                        show_parameter_hints = false,
                        parameter_hints_prefix = "",
                        other_hints_prefix = ": ",
                    },
                },
            })
        end,
    },
}

-- resources:
-- https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples#rust-with-rust-toolsnvim
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
