-- see https://github.com/LazyVim/LazyVim/blob/a72a84972d85e5bbc6b9d60a0983b37efef21b8a/lua/lazyvim/plugins/treesitter.lua#L7

return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is very old
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
}
