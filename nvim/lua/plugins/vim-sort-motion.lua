return {
    {
        "christoomey/vim-sort-motion",
        config = function() vim.g.sort_motion_flags = "i" end,
        keys = {
            {
                "gs",
                "<Plug>SortMotion",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gs",
                "<Plug>SortMotionVisual",
                mode = { "x", },
                silent = true,
                noremap = true,
            },
        },
    },
}
