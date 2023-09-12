-- full wiki https://github.com/ibhagwan/fzf-lua/wiki
return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons", },
        config = function()
            require("fzf-lua").setup(
                { winopts = { height = 1.0, width = 1.0, }, }
            )
        end,
        keys = {
            {
                "<leader>b",
                "<cmd>lua require('fzf-lua').buffers()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>f",
                "<cmd>lua require('fzf-lua').grep_project()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>g",
                "<cmd>lua require('fzf-lua').git_files()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>h",
                "<cmd>lua require('fzf-lua').oldfiles()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>l",
                "<cmd>lua require('fzf-lua').blines()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>m",
                "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>p",
                "<cmd>lua require('fzf-lua').files()<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>r",
                "<cmd>lua require('fzf-lua').registers()<cr>",
                mode = { "n", },
                noremap = true,
            },
        },
    },
}
