return {
    {
        "luckasRanarison/tailwind-tools.nvim",
        -- enabled = false, -- monitor for any conflicts with tailwind prettier sorting
        name = "tailwind-tools",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        build = ":UpdateRemotePlugins",
        opts = {},
    },
}
