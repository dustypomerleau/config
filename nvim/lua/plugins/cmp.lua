-- see a full list of cmp sources at https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
-- in future consider adding https://github.com/hrsh7th/cmp-nvim-lsp but leave as-is for now

return {
	"hrsh7th/nvim-cmp",
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
	-- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
}
