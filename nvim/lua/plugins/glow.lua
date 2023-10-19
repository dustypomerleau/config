return { {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    keys = {
        {
            "<localleader>w",
            "<cmd>Glow<cr>",
            mode = { "n", },
            silent = true,
            noremap = true,
        },
    },
}, }
