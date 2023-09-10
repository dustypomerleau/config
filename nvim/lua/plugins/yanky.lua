return {
    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup({
                highlight = { on_put = true, on_yank = true, timer = 200, },
            })
        end,
        keys = {
            {
                "p",
                function() require("yanky").cmd("YankyPutAfter") end,
                mode = { "n", "x", },
                silent = true,
            },
            {
                "P",
                function() require("yanky").cmd("YankyPutBefore") end,
                mode = { "n", "x", },
                silent = true,
            },
            {
                "gp",
                function() require("yanky").cmd("YankyGPutAfter") end,
                mode = { "n", "x", },
                silent = true,
            },
            {
                "gP",
                function() require("yanky").cmd("YankyGPutBefore") end,
                mode = { "n", "x", },
                silent = true,
            },
        },
    },
}
