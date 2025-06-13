return {
    {
        "OXY2DEV/markview.nvim",
        version = "*",

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },

        lazy = false,

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
