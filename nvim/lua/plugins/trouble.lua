return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", },
        event = "VeryLazy",
        keys = {
            {
                "<leader>d",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                { noremap = true, },
            },
            {
                "<localleader>d",
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                { noremap = true, },
            },
        },
    },
}
