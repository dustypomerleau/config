return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        event = "VeryLazy",

        config = function()
            require("mini.ai").setup({})

            require("mini.files").setup({
                options = { permanent_delete = false }, -- trash location is ~/.local/share/nvim/mini.files/trash/
                windows = { preview = true, width_preview = 100 },
            })

            -- place the notifications window at the bottom right
            local win_config = function()
                local has_statusline = vim.o.laststatus > 0
                local bottom_space = vim.o.cmdheight + (has_statusline and 1 or 0)
                return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - bottom_space }
            end
            require("mini.notify").setup({
                -- sort most recent notifications first
                sort = function(notif_arr)
                    table.sort(notif_arr, function(a, b) return a.ts_update > b.ts_update end)
                    return notif_arr
                end,

                lsp_progress = { duration_last = 200 },
                window = { config = win_config, max_width_share = 0.5 },
            })
            -- use mini as the default notification system
            vim.notify = require("mini.notify").make_notify()

            -- avoid gx, as this conflicts with gx plugin for following links
            -- keep defaults for evaluate (g=), multiply (gm), replace with register (gr), sort (gs)
            --
            -- By default this uses `table.sort()`, which is case-sensitive, you can override this
            -- in `setup()` to use `:sort i` if you prefer.
            require("mini.operators").setup({ exchange = { prefix = "ga" } })

            -- using nvim-surround rather than mini.surround due to binding conflicts
        end,

        keys = {
            {
                "-",
                "<cmd>lua MiniFiles.open()<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>n",
                "<cmd>lua MiniNotify.show_history()<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
