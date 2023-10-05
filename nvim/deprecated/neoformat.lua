return {
    "sbdchd/neoformat",
    enabled = false, -- use conform instead
    event = "VeryLazy",
    init = function()
        vim.g.neoformat_try_node_exe = 1
    end,
}
