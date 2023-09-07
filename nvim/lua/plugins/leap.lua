return {
    {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end,
        keys = {
            {
                "o",
                function()
                    require("leap").cmd("leap-forward-to")
                end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "O",
                function()
                    require("leap").cmd("leap-backward-to")
                end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "go",
                function()
                    require("leap").cmd("leap-from-window")
                end,
                mode = { "n", },
                silent = true,
            },
        },
    },
}
