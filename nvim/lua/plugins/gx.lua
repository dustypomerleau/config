return {
    {
        "chrishrb/gx.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufEnter" },
        cmd = { "Browse" },
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        init = function()
            vim.g.netrw_nogx = 1 -- disable netrw gx
        end,
        config = true,
    },
}
