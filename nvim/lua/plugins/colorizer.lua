-- originally nvchad/nvim-colorizer.lua
-- then:
-- norcalli/nvim-colorizer.lua
-- then:
-- catgoose/nvim-colorizer.lua
-- which appears to be the most up to date

return {
    {
        "catgoose/nvim-colorizer.lua",
        version = false,

        config = function()
            require("colorizer").setup({
                user_default_options = {
                    AARRGGBB = false, -- 0xAARRGGBB hex codes
                    RGB = true, -- #RGB hex codes
                    RGBA = true, -- #RGBA hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    RRGGBBAA = true, -- #RRGGBBAA hex codes
                    css = false, -- Enable all CSS *features*:
                    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    hsl_fn = true, -- CSS hsl() and hsla() functions
                    rgb_fn = true, -- CSS rgb() and rgba() functions
                    tailwind = false, -- Enable tailwind colors
                },
            })
        end,

        keys = { { "<localleader>c", "<cmd>ColorizerToggle<cr>" } },
    },
}
