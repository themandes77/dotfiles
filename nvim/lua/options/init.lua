vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.textwidth = 100
vim.opt.tabstop = 2
vim.o.signcolumn = "yes"
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.opt.winborder = "rounded"
vim.opt.colorcolumn = "100"
vim.opt.hlsearch = false
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.opt.conceallevel = 0
vim.opt.guicursor = {
	"i-ci-ve:hor15",
	"n-v-c:hor15",
}

vim.api.nvim_create_autocmd("FileType", { -- treats vimwiki buffers as markdown buffers
	pattern = "vimwiki",
	callback = function()
		vim.bo.filetype = "markdown"
		vim.bo.syntax = "vimwiki"
	end,
})
