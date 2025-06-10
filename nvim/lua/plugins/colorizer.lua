return {
    {
        "nvchad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    AARRGGBB = true, -- 0xAARRGGBB hex codes
                    RGB = true, -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    RRGGBBAA = true, -- #RRGGBBAA hex codes
                    hsl_fn = true, -- CSS hsl() and hsla() functions
                    names = false, -- "Name" codes like Blue or blue
                    rgb_fn = true, -- CSS rgb() and rgba() functions
                },
            })
        end,
        keys = { { "<localleader>c", "<cmd>ColorizerToggle<cr>" } },
    },
}
