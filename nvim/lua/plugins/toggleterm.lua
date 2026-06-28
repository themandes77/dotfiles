local tt = require("toggleterm")
tt.setup()

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "toggle term" })
