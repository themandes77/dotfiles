local km = vim.keymap
local oil = require("oil")
oil.setup({
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["q"] = { "actions.close", mode = "n"},
    ["<CR>"] = "actions.select",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
  }
})


km.set("n", "<leader>ff", "<cmd>Oil<CR>", {desc = "Open oil"})
