return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {
                "<localleader>w",
                "<cmd>Markview<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
