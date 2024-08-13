return {
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({
                style = "dracula",
                border = false,
                width = 120,
                height_ratio = 1,
            })
        end,
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
    },
}
