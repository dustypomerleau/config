return {
    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function() require("leap").add_default_mappings() end,
        keys = {
            {
                "o",
                "<Plug>(leap-forward-to)",
                mode = { "o", "x", },
                silent = true,
            },
            {
                "O",
                "<Plug>(leap-backward-to)",
                function()
                    require("leap").cmd("leap-backward-to")
                end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "go",
                "<Plug>(leap-from-window)",
                mode = { "n", },
                silent = true,
            },
        },
    },
}
