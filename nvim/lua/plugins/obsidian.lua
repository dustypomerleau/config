return {
    {
        "obsidian-nvim/obsidian.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        version = "*",
        ft = "markdown",
        opts = {
            daily_notes = {
                folder = "daily",
                date_format = "%Y%m%d",
                template = "daily-template.md",
            },
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gf"] = {
                    action = function() return require("obsidian").util.gf_passthrough() end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<localleader>oc"] = {
                    action = function() return require("obsidian").util.toggle_checkbox() end,
                    opts = { buffer = true },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<cr>"] = {
                    action = function() return require("obsidian").util.smart_action() end,
                    opts = { buffer = true, expr = true },
                },
            },
            templates = {
                subdir = "templates",
                date_format = "%Y%m%d",
                time_format = "%H:%M",
            },
            ui = { enable = false },
            workspaces = {
                {
                    name = "mind",
                    path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/mind",
                },
            },
        },
        keys = {
            {
                "<localleader>ot",
                "<cmd>ObsidianNewFromTemplate<cr>",
                mode = { "n" },
                desc = "Obsidian: new from template",
            },
        },
    },
}
