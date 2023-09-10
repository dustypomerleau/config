return {
    {
        "tpope/vim-surround",
        config = true,
        keys = {
            {
                "s",
                function() require("vim-surround").cmd("VSurround") end,
                mode = { "x", },
                silent = true,
            },
        },
    },
}
