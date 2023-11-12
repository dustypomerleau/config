return {
    {
        "tpope/vim-surround",
        keys = {
            -- default mappings (ys.. ds.. cs..)
            -- this is broken, you need to use <plug> to call this
            -- but in any event, you aren't using this as you're switching to nvim-surround
            {
                "s",
                function() require("vim-surround").cmd("VSurround") end,
                mode = { "x", },
                silent = true,
            },
        },
    },
}
