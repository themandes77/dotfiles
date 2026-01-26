vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
-- vim.opt.textwidth = 100
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
	"n-v-c:box",
	"a:blinkoff1-blinkon250",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	-- pattern = {"python", "javascript", "html"},
	callback = function()
		vim.opt_local.textwidth = 100
	end,
})

if vim.g.neovide then
	vim.print(vim.g.neovide_version)
	vim.o.guifont = "DepartureMono Nerd Font:h15"
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
end

vim.api.nvim_create_autocmd("FileType", { -- treats vimwiki buffers as markdown buffers
	pattern = "vimwiki",
	callback = function()
		vim.bo.filetype = "markdown"
		vim.bo.syntax = "vimwiki"
	end,
})
