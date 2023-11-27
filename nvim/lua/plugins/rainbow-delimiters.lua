return {
    {
        "hiphish/rainbow-delimiters.nvim",
        lazy = false,
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")

            vim.g.rainbow_delimiters = {
                strategy = { [""] = rainbow_delimiters.strategy["global"], },
                query = {
                    [""] = "rainbow-delimiters",
                    latex = "rainbow-blocks",
                },
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                },
            }
        end,
    },
}
