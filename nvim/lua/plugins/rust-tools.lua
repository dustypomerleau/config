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
        ft = "rust",
        config = function()
            local rt = require("rust-tools")
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities() -- see cmp.lua

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions,
                            { buffer = bufnr, })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group,
                            { buffer = bufnr, })
                    end,
                    -- capabilities = capabilities,
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

-- you need to somehow marry
-- https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples#rust-with-rust-toolsnvim
-- with the setup in cmp - i think you should only be calling setup once
--
-- start with:
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
