local oil = require("oil")
local fzf = require("fzf-lua")
local flash = require("flash")
local ls = require("luasnip")
local km = vim.keymap
local mason = require("mason")

-- neovim
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "<leader>lz", ":Lazy<CR>")
-- oil
km.set("n", "<leader>f", oil.open)
-- fzf-lua
km.set("n", ";f", fzf.files)
km.set("n", "\\\\", fzf.buffers)
km.set("n", ";e", fzf.diagnostics_document)
km.set("n", ";s", fzf.live_grep)
-- obsidian
km.set("n", ";o", function()
	fzf.files({ cwd = "/home/mandes/Notes" })
end, { desc = "open obsidian vault" })
-- luasnip
km.set({ "i" }, "<c-k>", function()
	ls.expand()
end, { silent = true, noremap = true })
km.set({ "i", "s" }, "<c-l>", function()
	ls.jump(1)
end, { silent = true })
km.set({ "i", "s" }, "<c-j>", function()
	ls.jump(-1)
end, { silent = true })
km.set({ "i", "s" }, "<c-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
-- flash.nvim
km.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "flash jump", silent = true })
km.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "flash treesitter", silent = true })
km.set({ "n", "x", "o" }, "<c-s>", function()
	flash.toggle()
end, { desc = "flash toggle", silent = true })
-- UFO.nvim --
km.set("n", "zR", require("ufo").openAllFolds, {})
km.set("n", "zM", require("ufo").closeAllFolds, {})
km.set("n", "zK", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, {})

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
-- Mason --
km.set("n", "<leader>M", ":Mason<CR>")
