return {
    {
        "christoomey/vim-sort-motion",
        config = function() vim.g.sort_motion_flags = "i" end,
        keys = {
            {
                "gs",
                function()
                    require("vim-sort-motion").cmd("SortMotion")
                end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gs",
                function()
                    require("vim-sort-motion").cmd("SortMotionVisual")
                end,
                mode = { "x", },
                silent = true,
                noremap = true,
            },
        },
    },
}
