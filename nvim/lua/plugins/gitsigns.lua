return {
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        keys = {
            {
                "<leader><leader>g",
                function()
                    require("gitsigns").cmd("toggle_signs")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gb",
                function()
                    require("gitsigns").cmd("stage_buffer")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gc",
                function()
                    require("gitsigns").cmd("change_base")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gd",
                function()
                    require("gitsigns").cmd("diffthis")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gh",
                function()
                    require("gitsigns").cmd("stage_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gm",
                function()
                    require("gitsigns").cmd("toggle_current_line_blame")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gn",
                function()
                    require("gitsigns").cmd("next_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gN",
                function()
                    require("gitsigns").cmd("previous_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gp",
                function()
                    require("gitsigns").cmd("preview_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>grb",
                function()
                    require("gitsigns").cmd("reset_buffer")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>grc",
                function()
                    require("gitsigns").cmd("reset_base")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>grh",
                function()
                    require("gitsigns").cmd("reset_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gu",
                function()
                    require("gitsigns").cmd("undo_stage_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gv",
                function()
                    require("gitsigns").cmd("select_hunk")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gw",
                function()
                    require("gitsigns").cmd("toggle_word_diff")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>gx",
                function()
                    require("gitsigns").cmd("toggle_deleted")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                -- not sure this will work — official docs have:
                -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                "ih",
                function()
                    require("gitsigns").cmd("select_hunk")
                end,
                mode = { "o", "x", },
                noremap = true,
            },
        },
    },
}
