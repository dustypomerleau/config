return {
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            height = 0.99,
                            width = 0.99,
                        },
                    },
                },
                extensions = {
                    -- these bindings need to be wrapped in a function if you include theme in the
                    -- opts passed to telescope-undo, so it's easier to include them here.
                    undo = {
                        mappings = {
                            i = {
                                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                                ["<C-cr>"] = require("telescope-undo.actions").restore,
                                -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                                ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
                                ["<C-r>"] = require("telescope-undo.actions").restore,
                            },
                            n = {
                                ["y"] = require("telescope-undo.actions").yank_additions,
                                ["Y"] = require("telescope-undo.actions").yank_deletions,
                                ["u"] = require("telescope-undo.actions").restore,
                            },
                        },
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>t",
                ":Telescope<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>b",
                ":Telescope buffers<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>f",
                ":Telescope live_grep<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>g",
                ":Telescope git_files<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>h",
                ":Telescope oldfiles<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>j",
                ":Telescope jumplist<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>k",
                ":Telescope keymaps<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>l",
                ":Telescope current_buffer_fuzzy_find<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>m",
                ":Telescope lsp_dynamic_workspace_symbols<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>p",
                ":Telescope find_files<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>r",
                ":Telescope registers<cr>",
                mode = { "n", },
                noremap = true,
            },
        },
    },
}
