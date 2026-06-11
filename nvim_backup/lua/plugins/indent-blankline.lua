return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	config = function()
		local opts = {
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		}
		require("ibl").setup(opts)
	end,
}
