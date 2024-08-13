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
        ft = { "tex", "latex", },
        keys = {
            {
                "<localleader>v",
                "<cmd>VimtexView<cr>",
                mode = { "n", },
                silent = false,
            },
            {
                "<localleader>k",
                "<cmd>VimtexCompile<cr>",
                mode = { "n", },
                silent = false,
            },
        },
    },
}
