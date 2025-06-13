return {
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "*",
        lazy = false,
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│", -- box drawings light vertical (U+2502)
                    highlight = "LineNr",
                },

                scope = {
                    show_start = false,
                    highlight = { "RainbowRed", "RainbowYellow", "RainbowBlue" },
                },
            })
        end,
    },
}
