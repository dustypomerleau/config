return {
    {
        "nvchad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    RGB = true, -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    names = false, -- "Name" codes like Blue or blue
                    RRGGBBAA = true, -- #RRGGBBAA hex codes
                    AARRGGBB = true, -- 0xAARRGGBB hex codes
                    rgb_fn = true, -- CSS rgb() and rgba() functions
                    hsl_fn = true, -- CSS hsl() and hsla() functions
                    tailwind = true,
                },
            })
        end,
        keys = { { "<localleader>c", "<cmd>ColorizerToggle<cr>" } },
    },
}
