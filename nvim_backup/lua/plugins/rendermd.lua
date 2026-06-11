return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use standalone mini plugins
	opts = {
		render_modes = {
			"n",
			"c",
			"t",
		},
		completions = {
			lsp = { enabled = true },
		},
	},
	config = function()
		require("render-markdown").setup({})
	end,
}
