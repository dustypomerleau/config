return {
    {
        "chrisgrieser/nvim-spider",
        config = true,
        keys = {
            {
                "b",
                "<cmd>lua require('spider').motion('b')<cr>",
                mode = { "n", "o", "x" },
                silent = true,
                noremap = true,
            },
            {
                "e",
                "<cmd>lua require('spider').motion('e')<cr>",
                mode = { "n", "o", "x" },
                silent = true,
                noremap = true,
            },
            {
                "w",
                "<cmd>lua require('spider').motion('w')<cr>",
                mode = { "n", "o", "x" },
                silent = true,
                noremap = true,
            },
            {
                "ge",
                "<cmd>lua require('spider').motion('ge')<cr>",
                mode = { "n", "o", "x" },
                silent = true,
                noremap = true,
            },
        },
    },
}
