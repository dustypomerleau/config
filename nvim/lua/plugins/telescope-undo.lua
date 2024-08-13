return {
    {
        "debugloop/telescope-undo.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim", },
            },
        },
        keys = { { "<leader>u", "<cmd>Telescope undo<cr>", }, },
        -- If you have found the undo state you were looking for, you can use <C-cr> or <C-r> to revert to that state.
        -- If you'd rather not change your whole buffer, you can use <cr> to yank the additions of this undo state into your default register (use <S-cr> or <C-y> to yank the deletions).
        -- Note: keybindings for telescope-undo are passed in the setup function of telescope.lua, rather
        -- than being entered here, to avoid
        -- an error related to module availability.
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
}
