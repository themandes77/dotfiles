vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", {desc = "Open parent directory"})
vim.keymap.set("n", "<leader>p", "<CMD>Lazy<CR>", {desc = "Open lazy plugin manager"})
vim.keymap.set("n", "<leader>t", "<CMD>FloatermToggle --height=1 --width=0.9<CR>", {desc = "Open new floating terminal"})
vim.api.nvim_set_keymap("n", ":", '<cmd>FineCmdline<CR>', {noremap = true})
