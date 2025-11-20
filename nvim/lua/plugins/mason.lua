return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = { "luau_lsp" },
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua_ls",
				"stylua",
				"luau_lsp",
				"selene",
			},
		})
	end,
}
