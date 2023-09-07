return {
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "--shell-escape",
                    "-file-line-error",
                    "-interaction=nonstopmode",
                    "-pdf",
                    "-synctex=1",
                    "-verbose",
                },
            }
            vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex", }
            vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull", }
        end,
        keys = {
            {
                "<localleader>v",
                function()
                    require("vimtex").cmd("vimtex-view")
                end,
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>k",
                function()
                    require("vimtex").cmd("vimtex-compile")
                end,
                mode = { "n", },
                silent = false,
            },
        },
    },
}
