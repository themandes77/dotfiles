function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
		config = function()
			ColorMyPencils()
		end,
	},

	{
		"catppuccin/nvim",
		lazy = false,
		opts = {},
		config = function()
			ColorMyPencils()
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})

			ColorMyPencils()
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			ColorMyPencils()
		end,
	},
}
