return { {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")

        npairs.setup({})
        npairs.add_rules({
            Rule("<", ">", { "edgeql", "rust", }),
            Rule("\"", "\"", { "-vim", }),
        })
    end,
}, }
