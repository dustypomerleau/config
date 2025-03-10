local telescopeConfig = require("telescope.config")
local rg_args = { unpack(telescopeConfig.values.vimgrep_arguments) }
local extra_args = { "--hidden", "--glob", "!**/.git/*", "--glob", "!**/.jj/*", "--trim" }

for _, v in ipairs(extra_args) do
    table.insert(rg_args, v)
end

local function jj_files()
    require("telescope.builtin").git_files({
        prompt_title = "jj Files",
        git_command = { "jj", "file", "list", "--no-pager" },
    })
end

return {
    {
        -- "nvim-telescope/telescope.nvim",
        -- The next 2 lines are a temporary workaround until your PR is merged:
        "dustypomerleau/telescope.nvim",
        commit = "03c1fb911717fa7260576ae47325cf473d98c7bf",
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            height = 0.99,
                            width = 0.99,
                        },
                    },
                    -- `hidden = true` is not supported in text grep commands.
                    vimgrep_arguments = rg_args,
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
                pickers = {
                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` and `.jj/`as it isn't in `.gitignore`.
                        find_command = {
                            "rg",
                            "--files",
                            "--hidden",
                            "--glob",
                            "!**/.git/*",
                            "--glob",
                            "!**/.jj/*",
                        },
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>t",
                ":Telescope<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>b",
                ":Telescope buffers<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>f",
                ":Telescope live_grep<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>g",
                jj_files,
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>h",
                ":Telescope oldfiles<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>j",
                ":Telescope jumplist<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>k",
                ":Telescope keymaps<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>l",
                ":Telescope current_buffer_fuzzy_find<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>m",
                ":Telescope lsp_dynamic_workspace_symbols<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>p",
                ":Telescope find_files<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>r",
                ":Telescope registers<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
