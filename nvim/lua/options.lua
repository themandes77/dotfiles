vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.smartindent = true
-- vim.opt.autochdir = true
vim.opt.signcolumn = "yes:1"

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.hlsearch = false
vim.opt.conceallevel = 0
vim.opt.autochdir = true

if vim.g.neovide then
	vim.print(vim.g.neovide_version)
	vim.o.guifont = "Terminess Nerd Font Mono:h16"
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
end

