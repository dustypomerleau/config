return {
    {
        "arsham/indent-tools.nvim",
        branch = "master",

        dependencies = {
            "arsham/arshlib.nvim",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },

        event = "BufEnter",
        config = true,
    },
}
