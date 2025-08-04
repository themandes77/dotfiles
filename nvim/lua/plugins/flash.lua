vim.pack.add({
	{ src = "https://github.com/folke/flash.nvim" },
})

local flash = require("flash")

flash.setup({
	modes = {
		search = {
			enabled = true,
		},
	},
	char = {
		jump_labels = true,
	},
})
