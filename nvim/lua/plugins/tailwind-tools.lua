return {
    {
        "luckasRanarison/tailwind-tools.nvim",
        enabled = false, -- not clear what this adds over tailwind prettier sorting, etc.
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
