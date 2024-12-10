return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        config = true,
        keys = {
            {
                "<localleader>t",
                ":TypstPreviewToggle<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
