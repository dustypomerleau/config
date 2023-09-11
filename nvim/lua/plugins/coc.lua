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
                function() require("coc.nvim").cmd("coc-rename") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gd",
                function() require("coc.nvim").cmd("coc-definition") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gf",
                function() require("coc.nvim").cmd("coc-float-jump") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gd",
                function() require("coc.nvim").cmd("coc-definition") end,
                mode = { "n", },
                silent = true,
                noremap = true,
            },
            {
                "gd",
                function() require("coc.nvim").cmd("coc-definition") end,
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
                function() require("coc.nvim").cmd("coc-funcobj-i") end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "af",
                function() require("coc.nvim").cmd("coc-funcobj-a") end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "ic",
                function() require("coc.nvim").cmd("coc-classobj-i") end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "ac",
                function() require("coc.nvim").cmd("coc-classobj-a") end,
                mode = { "o", "x", },
                silent = true,
            },
            -- todo: scroll in float windows coc#float#has_scroll()
        },
    },
}
