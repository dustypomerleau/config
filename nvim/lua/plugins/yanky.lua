return {
    {
        "gbprod/yanky.nvim",
        version = false,
        lazy = false,

        config = function()
            require("yanky").setup({
                highlight = { on_put = true, on_yank = true, timer = 200 },
            })
        end,

        keys = {
            {
                "<c-n>",
                "<Plug>(YankyCycleForward)",
                mode = { "n" },
                silent = true,
            },
            {
                "<c-p>",
                "<Plug>(YankyCycleBackward)",
                mode = { "n" },
                silent = true,
            },
            {
                "p",
                "<Plug>(YankyPutAfter)",
                mode = { "n", "x" },
                silent = true,
            },
            {
                "P",
                "<Plug>(YankyPutBefore)",
                mode = { "n", "x" },
                silent = true,
            },
            {
                "gp",
                "<Plug>(YankyGPutAfter)",
                mode = { "n", "x" },
                silent = true,
            },
            {
                "gP",
                "<Plug>(YankyGPutBefore)",
                mode = { "n", "x" },
                silent = true,
            },
            {
                "gy",
                "<cmd>YankyRingHistory<cr>",
                mode = { "n", "x" },
                silent = true,
            },
        },
    },
}
