return {
    "pmizio/typescript-tools.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", },
    opts = {},
}

-- you may need
--
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- config = function()
--     require("typescript-tools").setup({ capabilities = capabilities, })
-- end
--
-- (previously you ran this setup in cmp.lua with the others)
-- but get typescript tools working by itself first
