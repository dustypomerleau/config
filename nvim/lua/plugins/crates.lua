return {
    {
        "Saecki/crates.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- tag = "stable", -- uncomment to switch from nightly to stable
        event = { "BufRead Cargo.toml" },
        opts = { completion = { cmp = { enabled = true } } },
        keys = {
            {
                "<localleader>ra",
                "<cmd>Crates update_all_crates<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>rd",
                "<cmd>Crates open_documentation<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>re",
                "<cmd>Crates show_dependencies_popup<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>rh",
                "<cmd>Crates show_popup<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>rp",
                "<cmd>Crates open_repository<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>ru",
                "<cmd>Crates update_crate<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
