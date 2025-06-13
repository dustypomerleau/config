return {
    {
        "arsham/indent-tools.nvim",
        version = "*",

        dependencies = {
            "arsham/arshlib.nvim",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },

        event = "BufEnter",
        config = true,
    },
}
