return {
	{
		"miikanissi/modus-themes.nvim",
	},
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				float = {
					transparent = false,
					solid = false,
				},
				transparent_background = true,
				integrations = {
					notify = true,
				},
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}
