return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = true,
			auto_install = true,
		})
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("Highlighter", {}),
			pattern = "markdown",
			callback = function(args)
				vim.treesitter.start(args.buf)
			end,
		})
	end,
}
