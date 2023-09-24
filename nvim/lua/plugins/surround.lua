return {
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            -- avoid a conflict with flash in `o` mode
            require("nvim-surround").setup({ keymaps = { delete = "do", }, })
        end,
    },
}
