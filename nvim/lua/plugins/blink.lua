-- see https://cmp.saghen.dev for config options

return {
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            cmdline = { completion = { menu = { auto_show = true } } },

            completion = {
                documentation = { auto_show = true },
                ghost_text = { enabled = true },
                list = {
                    selection = {
                        -- `auto_insert = false` due to https://github.com/Saghen/blink.cmp/issues/1736
                        auto_insert = false,
                        preselect = false,
                    },
                },
                menu = { max_height = 15 },
            },

            fuzzy = { implementation = "rust" },
            keymap = { preset = "default" },
            signature = { enabled = true },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
        },

        opts_extend = { "sources.default" },
    },
}
