return {
    {
        "dustypomerleau/tol.nvim",
        branch = "dev",
        lazy = false,
        priority = 1000,
        config = function() vim.cmd([[colorscheme tol]]) end,
    },
}
