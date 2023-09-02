return {
    {
        "easymotion/vim-easymotion",
        config = function() vim.g.EasyMotion_smartcase = 1 end,
        keys = {
            {
                "s",
                function()
                    require("vim-easymotion").cmd("easymotion-s")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<leader>k",
                function()
                    require("vim-easymotion").cmd("easymotion-bd-jk")
                end,
                mode = { "n", "o", "x", },
                silent = false,
            },
            {
                "<leader>s",
                function()
                    require("vim-easymotion").cmd("easymotion-s")
                end,
                mode = { "o", "x", },
                silent = false,
            },
        },
    },
}
