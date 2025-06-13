-- todo: replace with https://github.com/folke/snacks.nvim
-- return { { "stevearc/dressing.nvim", event = "VeryLazy" } }

return {
    {
        "folke/snacks.nvim",
        version = "*",
        priority = 1000,
        lazy = false,

        opts = {
            bigfile = { enabled = false },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = true }, -- options at https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
    },
}
