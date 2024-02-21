-- todo: configure snippets using instructions at https://github.com/L3MON4D3/LuaSnip
return {
    {
        "l3mon4d3/luasnip",
        version = "^2", -- keep at latest released major
        build = "make install_jsregexp",
        event = "BufEnter",
    },
}
