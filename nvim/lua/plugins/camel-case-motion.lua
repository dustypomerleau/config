return {
    {
        "bkad/camelcasemotion",
        keys = {
            {
                "b",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_b")
                end,
                mode = { "n", "o", "x", },
                silent = true,
            },
            {
                "e",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_e")
                end,
                mode = { "n", "o", "x", },
                silent = true,
            },
            {
                "ge",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_ge")
                end,
                mode = { "n", "o", "x", },
                silent = true,
            },
            {
                "w",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_w")
                end,
                mode = { "n", "o", "x", },
                silent = true,
            },
            {
                "<leader>ib",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_ib")
                end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "<leader>ie",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_ie")
                end,
                mode = { "o", "x", },
                silent = true,
            },
            {
                "<leader>iw",
                function()
                    require("camelcasemotion").cmd("CamelCaseMotion_iw")
                end,
                mode = { "o", "x", },
                silent = true,
            },
        },
    },
}
