local km = vim.keymap
local fzf = require("fzf-lua")

---- // Open Oil \\ ----
km.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
---- // Open Lazy \\ ----
km.set("n", "<leader>p", "<CMD>Lazy<CR>", { desc = "Open lazy plugin manager" })
---- // FloatTerm stuff \\ ----
km.set("n", "<leader>t", "<CMD>FloatermToggle --height=1 --width=0.9<CR>", { desc = "Open new floating terminal" })
---- // FineCmdLine thing \\ ----
km.set("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
---- // Open Mason \\ ----
km.set("n", "<leader>m", "<CMD>Mason<CR>", { desc = "Open Mason" })
---- // Open mini.files \\ ----
km.set("n", "sf", require("mini.files").open, { desc = "Mini.files" })
---- // FzF-lua stuff \\ ----
km.set("n", ";r", fzf.registers, { desc = "FzF registers" })
km.set("n", ";s", fzf.live_grep, { desc = "FzF live grep" })
km.set("n", "\\\\", fzf.buffers, { desc = "Open FzF buffers" })
---- // Some bindings \\ ----
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
