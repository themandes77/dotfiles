return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			automatic_enable = {
				exclude = { "luau_lsp" },
			},
		})
	end,
}
