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
                function()
                    require("fzf-lua").cmd("buffers")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>f",
                function()
                    require("fzf-lua").cmd("grep_project")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>g",
                function()
                    require("fzf-lua").cmd("git_files")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>h",
                function()
                    require("fzf-lua").cmd("oldfiles")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>l",
                function()
                    require("fzf-lua").cmd("blines")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>m",
                function()
                    require("fzf-lua").cmd("lsp_workspace_symbols")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>p",
                function()
                    require("fzf-lua").cmd("files")
                end,
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>r",
                function()
                    require("fzf-lua").cmd("registers")
                end,
                mode = { "n", },
                noremap = true,
            },
        },
    },
}
