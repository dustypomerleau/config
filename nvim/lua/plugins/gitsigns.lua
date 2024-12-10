-- function derived from:
-- https://github.com/andrewferrier/dotfiles/blob/919719a153d34393b787e4c0a394de56e764004a/common/.config/nvim/lua/plugins/gitsigns.lua#L3
local function visual_stage()
    -- "v" represents the start of the visual area.
    local first_line = vim.fn.line("v")
    -- "." represents the current cursor position. `getpos()` returns a list with lnum at [2].
    local last_line = vim.fn.getpos(".")[2]
    require("gitsigns").stage_hunk({ first_line, last_line })
    -- switch back to normal mode
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "t", false)
end

return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
        keys = {
            {
                "<leader><leader>g",
                "<cmd>Gitsigns toggle_signs<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gb",
                "<cmd>Gitsigns stage_buffer<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gc",
                "<cmd>Gitsigns change_base<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gd",
                "<cmd>Gitsigns diffthis<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gh",
                "<cmd>Gitsigns stage_hunk<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gm",
                "<cmd>Gitsigns toggle_current_line_blame<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gn",
                "<cmd>Gitsigns next_hunk<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gp",
                "<cmd>Gitsigns prev_hunk<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>ge",
                "<cmd>Gitsigns preview_hunk_inline<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gl",
                "<cmd>Gitsigns blame_line<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>grb",
                "<cmd>Gitsigns reset_buffer<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>grc",
                "<cmd>Gitsigns reset_base<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>grh",
                "<cmd>Gitsigns reset_hunk<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gs",
                function() visual_stage() end,
                mode = { "x" },
                noremap = true,
            },
            {
                "<localleader>gu",
                "<cmd>Gitsigns undo_stage_hunk<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gv",
                "<cmd>Gitsigns select_hunk<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gw",
                "<cmd>Gitsigns toggle_word_diff<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gx",
                "<cmd>Gitsigns toggle_deleted<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "ih",
                "<cmd>Gitsigns select_hunk<cr>",
                mode = { "o", "x" },
                noremap = true,
            },
        },
    },
}
