-- note: there is a bug in spectre that creates problems with building nvim-oxi
-- And the fix is to simply create a spectre_oxi/.cargo/config file with the following content:
--
-- ```
-- [build]
-- rustflags = [
--   "-C", "link-arg=-undefined",
--   "-C", "link-arg=dynamic_lookup",
-- ]
-- ```
--
-- not sure when this will be fixed but updates could break it - see:
-- https://github.com/nvim-pack/nvim-spectre/issues/185

return {
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim", },
        config = function()
            require("spectre").setup({
                default = { replace = { cmd = "oxi", }, },
            })
        end,
        keys = {
            {
                "<leader>e",
                '<cmd>lua require("spectre").toggle()<cr>',
                mode = { "n", },
                noremap = true,
            },
        },
    },
}
