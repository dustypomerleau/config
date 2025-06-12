vim.g.rustaceanvim = {
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- for a list of all possible config, see:
                -- https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/config.rs
                cargo = { features = "all" },
                check = {
                    allTargets = true,
                    features = "all",
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
                inlayHints = { maxLength = 100 },
                -- procMacro = { ignored = { leptos_macro = { "component", "server" } } },
                workspace = { symbol = { search = { kind = "all_symbols" } } },
            },
        },
    },
}

return {
    {
        "mrcjkb/rustaceanvim",
        version = "*", -- pin to releases, but allow majors
        lazy = false, -- the plugin handles its own lazy loading
        keys = {
            {
                "<localleader>sj",
                ":RustLsp moveItem down<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sk",
                ":RustLsp moveItem up<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sm",
                ":RustLsp expandMacro<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sp",
                ":RustLsp rebuildProcMacros<cr>",
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>sw",
                ":RustLsp reloadWorkspace<cr>",
                mode = { "n" },
                noremap = true,
            },
        },
    },
}
