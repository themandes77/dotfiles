vim.g.vimwiki_path = "~/vimwiki/"
vim.g.vimwiki_syntax = "markdown"
vim.g.vimwiki_ext = "md"

vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_global_ext = 0

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"markdown", "vimwiki"},
	callback = function()
		vim.opt_local.textwidth = 100
	end,
})
