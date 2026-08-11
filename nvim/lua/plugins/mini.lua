return {
    {
        "echasnovski/mini.nvim",
        branch = "main",
        event = "VeryLazy",

        config = function()
            require("mini.ai").setup({})

            require("mini.files").setup({
                -- lsp_timout is a workaround for https://github.com/nvim-mini/mini.nvim/issues/2511
                -- trash location is ~/.local/share/nvim/mini.files/trash/
                options = { lsp_timout = 0, permanent_delete = false },
                windows = { preview = true, width_preview = 100 },
            })

            require("mini.indentscope").setup({
                -- We only want this module for its text objects, so we push it to the background
                -- with priority 0 and use an empty string for the symbol.
                draw = { delay = 0, animation = function() return 0 end, priority = 0 },
                symbol = "",

                -- -- Textobjects
                -- object_scope = 'ii',
                -- object_scope_with_border = 'ai',
                --
                -- -- Motions (jump to respective border line; if not present - body line)
                -- goto_top = '[i',
                -- goto_bottom = ']i',
            })

            -- avoid gx, as this conflicts with gx plugin for following links
            -- keep defaults for evaluate (g=), multiply (gm), replace with register (gr), sort (gs)
            -- By default this uses `table.sort()`, which is case-sensitive, you can override this
            -- in `setup()` to use `:sort i` if you prefer.
            require("mini.operators").setup({ exchange = { prefix = "ga" } })

            -- using nvim-surround rather than mini.surround due to binding conflicts with flash in visual mode

            -- place the notifications window at the bottom right
            local win_config = function()
                local has_statusline = vim.o.laststatus > 0
                local bottom_space = vim.o.cmdheight + (has_statusline and 1 or 0)
                return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - bottom_space }
            end
        end,

        keys = {
            {
                "-",
                "<cmd>lua MiniFiles.open()<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
