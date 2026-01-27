---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()

vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then return end
        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
                p[i] = {
                    token = ev.data.params.token,

                    msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                    ),

                    done = value.kind == "end",
                }
                break
            end
        end

        local msg = {} ---@type string[]

        progress[client.id] = vim.tbl_filter(
            function(v) return table.insert(msg, v.msg) or not v.done end,
            p
        )

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

        vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,

            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})

return {
    {
        "folke/snacks.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional dep for icon support
        priority = 1000,
        lazy = false,

        opts = {
            gh = {},

            indent = {
                enabled = true,
                only_scope = true,
                priority = 1,
                hl = { "SnacksIndent" },
                animate = { enabled = false },

                scope = {
                    enabled = true,
                    priority = 200,
                    hl = { "SnacksIndentRed", "SnacksIndentYellow", "SnacksIndentBlue" },
                },
            },

            input = {},
            notifier = {}, -- options at https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md
            picker = { sources = { gh_issue = {}, gh_pr = {} } },
            bigfile = { enabled = false },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },

        keys = {
            {
                "<leader>x",
                function() Snacks.bufdelete() end,
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>X",
                function() Snacks.bufdelete.all() end,
                mode = { "n" },
                noremap = true,
            },
            {
                "<leader>z",
                function() Snacks.bufdelete.other() end,
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>n",
                function() Snacks.notifier.show_history() end,
                mode = { "n" },
                noremap = true,
            },
            {
                "<localleader>gi",
                function() Snacks.picker.gh_issue() end,
                desc = "GitHub Issues (open)",
            },
            {
                "<localleader>gI",
                function() Snacks.picker.gh_issue({ state = "all" }) end,
                desc = "GitHub Issues (all)",
            },
            {
                "<localleader>gt",
                function() Snacks.picker.gh_pr() end,
                desc = "GitHub Pull Requests (open)",
            },
            {
                "<localleader>gT",
                function() Snacks.picker.gh_pr({ state = "all" }) end,
                desc = "GitHub Pull Requests (all)",
            },
        },
    },
}
