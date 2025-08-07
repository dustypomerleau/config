return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = "markdown",

        opts = {
            legacy_commands = false, -- suppress warnings until v4 release.

            daily_notes = {
                folder = "daily",
                date_format = "%Y%m%d",
                template = "daily-template.md",
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
                "<localleader>ob",
                "<cmd>Obsidian backlinks<cr>",
                mode = { "n" },
                desc = "Obsidian: backlinks",
            },
            {
                "<localleader>oc",
                "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>",
                mode = { "n" },
                desc = "Obsidian: toggle checkbox",
            },
            {
                "<localleader>od",
                "<cmd>Obsidian dailies<cr>",
                mode = { "n" },
                desc = "Obsidian: daily notes",
            },
            {
                "<localleader>ol",
                "<cmd>Obsidian links<cr>",
                mode = { "n" },
                desc = "Obsidian: links",
            },
            {
                "<localleader>ot",
                "<cmd>Obsidian tags<cr>",
                mode = { "n" },
                desc = "Obsidian: tags",
            },
            {
                "<localleader>on",
                "<cmd>Obsidian new_from_template<cr>",
                mode = { "n" },
                desc = "Obsidian: new from template",
            },
        },
    },
}
