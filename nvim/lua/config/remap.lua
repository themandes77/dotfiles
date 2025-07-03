local km = vim.keymap
local fzf = require("fzf-lua")

---- // Neovim binds \\ ----
km.set("n", "<c-k>", ":wincmd k<CR>")
km.set("n", "sf", "<CMD>Oil<CR>", { desc = "Open Oil" })
km.set("n", "<c-j>", ":wincmd j<CR>")
km.set("n", "<c-h>", ":wincmd h<CR>")
km.set("n", "<c-l>", ":wincmd l<CR>")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
---- // Open Lazy \\ ----
km.set("n", "<leader>p", "<CMD>Lazy<CR>", { desc = "Open lazy plugin manager" })
---- // Open Mason \\ ----
km.set("n", "<leader>m", "<CMD>Mason<CR>", { desc = "Open Mason" })
---- // FzF-lua stuff \\ ----
km.set("n", ";r", fzf.registers, { desc = "FzF registers" })
km.set("n", ";s", fzf.live_grep, { desc = "FzF live grep" })
km.set("n", "\\\\", fzf.buffers, { desc = "Open FzF buffers" })
km.set("n", ";t", fzf.treesitter, { desc = "Open FzF treesitter" })
km.set("n", ";f", fzf.files, { desc = "Open FzF files" })
---- // Smal terminal \\ ----
km.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end)
---- // Lazy Git \\ ----
km.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
