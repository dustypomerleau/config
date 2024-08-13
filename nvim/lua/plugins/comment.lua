return {
    {
        "numtostr/comment.nvim",
        event = "BufEnter",
        config = function()
            require("Comment").setup({})
            local ft = require("Comment.ft")
            ft.edgeql = "#%s"
        end,
    },
}
