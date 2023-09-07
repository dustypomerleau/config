return {
    {
        "dustypomerleau/tol.nvim",
        lazy = false,
        priority = 1000,
        config = function() vim.cmd([[colorscheme tol]]) end,
    },
}
