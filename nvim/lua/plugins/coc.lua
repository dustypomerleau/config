local fn = vim.fn

function ShowDocumentation()
    if fn.CocAction("hasProvider", "hover") then
        fn.CocActionAsync("doHover")
    else
        fn.feedkeys("K", "in")
    end
end

return {
    {
        "neoclide/coc.nvim",
        branch = "release",
        lazy = false,
        config = function()
            vim.api.nvim_create_user_command(
                "Prettier",
                ":call CocAction('runCommand', 'prettier.formatFile')",
                { nargs = 0, }
            )
        end,
        keys = {
            {
                "<leader>d",
                "<cmd>CocDiagnostics<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<leader>v",
                "<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>",
                mode = { "n", },
                noremap = true,
            },
            {
                "<localleader>r",
                "<Plug>(coc-rename)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gd",
                "<Plug>(coc-definition)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gf",
                "<Plug>(coc-float-jump)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gy",
                "<Plug>(coc-type-definition)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gi",
                "<Plug>(coc-implementation)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gr",
                "<Plug>(coc-references)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "[g",
                "<Plug>(coc-diagnostic-prev)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "]g",
                "<Plug>(coc-diagnostic-next)",
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                -- test this, not certain it's correct
                -- for reference: https://github.com/jonwalstedt/dotfiles/blob/4aeb6914948cd354765961738f42f68d1a7083db/config/nvim-coc/lua/plugin/coc.lua#L106
                "K",
                function() ShowDocumentation() end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            -- text objects
            {
                "if",
                "<Plug>(coc-funcobj-i)",
                function() require("coc.nvim").cmd("coc-funcobj-i") end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "af",
                "<Plug>(coc-funcobj-a)",
                mode = { "o", "x", },
                silent = true,
            },
            {
                "ic",
                "<Plug>(coc-classobj-i)",
                mode = { "o", "x", },
                silent = true,
            },
            {
                "ac",
                "<Plug>(coc-classobj-a)",
                mode = { "o", "x", },
                silent = true,
            },
            -- todo: scroll in float windows coc#float#has_scroll()
        },
    },
}
