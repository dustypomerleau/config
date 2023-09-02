return {
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        keys = {
            {
                "<localleader>gb",
                function()
                    require("gitsigns").cmd("stage_buffer")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gc",
                function()
                    require("gitsigns").cmd("change_base")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gd",
                function()
                    require("gitsigns").cmd("diffthis")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gh",
                function()
                    require("gitsigns").cmd("stage_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gm",
                function()
                    require("gitsigns").cmd("toggle_current_line_blame")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gn",
                function()
                    require("gitsigns").cmd("next_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gN",
                function()
                    require("gitsigns").cmd("previous_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gp",
                function()
                    require("gitsigns").cmd("preview_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>grb",
                function()
                    require("gitsigns").cmd("reset_buffer")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>grc",
                function()
                    require("gitsigns").cmd("reset_base")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>grh",
                function()
                    require("gitsigns").cmd("reset_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gu",
                function()
                    require("gitsigns").cmd("undo_stage_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gv",
                function()
                    require("gitsigns").cmd("select_hunk")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gw",
                function()
                    require("gitsigns").cmd("toggle_word_diff")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>gx",
                function()
                    require("gitsigns").cmd("toggle_deleted")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                -- not sure this will work — official docs have:
                -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                "ih",
                function()
                    require("gitsigns").cmd("select_hunk")
                end,
                mode = { "o", "x", },
                silent = true,
            },
        },
    },
}

-- keep the gitsigns theme colors from nord, they're fine
