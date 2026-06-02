local km = vim.keymap
local ibuff = require("ibuff")

km.set("n", "<leader>hrr", "<cmd>restart<CR>", {desc = "Reload configuration"})
km.set("n", "<leader>so", "<cmd>source<CR>", {desc = "Source current file"})
km.set("n", "<leader>fc", "<cmd>e ~/dotfiles/nvim/init.lua<CR>", { desc = "Edit configuration files"})
km.set("n", "gl", vim.diagnostic.open_float, {desc = "Open diagnostics"})
km.set("n", "<leader>bp", "<cmd> bprevious <CR>", {desc = "Previous buffer"})
km.set("n", "<leader>bn", "<cmd> bnext <CR>", {desc = "Next buffer"})
km.set("n", "<leader>bq", "<cmd> bdelete! <CR>", {desc = "Delete buffer"})
km.set("n", "<leader>ca", function ()
  vim.lsp.buf.code_action()
end, { desc = "Open code actions" })

km.set("t", "<Esc>", "<C-\\><C-N>", {desc = "Exit terminal mode"}) -- Exit terminal mode

km.set("n", "<leader>bi", ibuff.open, {desc = "Open ibuff"})

km.set("n", "<leader>tv", function ()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_open_win(buf, true, {
        split = "below",
        height = 10,
    })
    vim.fn.jobstart(vim.o.shell, {term = true})
end)
