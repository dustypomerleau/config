-- snippets can be configured using instructions at https://github.com/L3MON4D3/LuaSnip
return {
    {
        "l3mon4d3/luasnip",
        version = "*",
        build = "make install_jsregexp",
        event = "BufEnter",
    },
}
