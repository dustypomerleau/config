return {
    {
        "chomosuke/typst-preview.nvim",
        version = "*",
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
