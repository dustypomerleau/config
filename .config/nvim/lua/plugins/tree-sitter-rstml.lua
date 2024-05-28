return {
    "rayliwell/tree-sitter-rstml",
    enabled = false, -- no point in using this, as rust analyzer semantic scopes override it
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter", },
}
