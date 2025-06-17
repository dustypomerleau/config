return {
    {
        "OXY2DEV/markview.nvim",
        version = "*",

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },

        lazy = false,
        opts = { preview = { enable = false } },

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
