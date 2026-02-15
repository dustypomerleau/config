return {
    {
        "numtostr/comment.nvim",
        version = false,
        event = "BufEnter",

        config = function()
            require("Comment").setup({})
            local ft = require("Comment.ft")
            ft.edgeql = "#%s"
            ft.hjson = "#%s"
            ft.theme = "#%s"
        end,
    },
}
