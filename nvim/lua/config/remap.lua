local km = vim.keymap
local fzf = require("fzf-lua")
local mini = require("mini.files")

km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
---- // Open mini.files \\ ----
km.set("n", "sf", mini.open, { desc = "Mini.files" })
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
