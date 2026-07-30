return {
    {
        "arsham/indent-tools.nvim",
        enabled = false,
        branch = "master",

        dependencies = {
            "arsham/arshlib.nvim",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },

        event = "BufEnter",
        config = true,
    },
}
