return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*", -- pin to latest stable
        dependencies = { "luarocks.nvim", },
        config = true,
        ft = "norg", -- probably no effect with `lazy = false`
    },
}
