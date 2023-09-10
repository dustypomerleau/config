return {
    {
        "tpope/vim-surround",
        config = true,
        keys = {
            -- default mappings (ys.. ds.. cs..)
            {
                "s",
                function() require("vim-surround").cmd("VSurround") end,
                mode = { "x", },
                silent = true,
            },
        },
    },
}
