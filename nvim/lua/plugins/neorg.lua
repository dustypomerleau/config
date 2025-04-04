return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        dependencies = { "luarocks.nvim" },
        config = true,
        ft = "norg", -- probably no effect with `lazy = false`
    },
}
