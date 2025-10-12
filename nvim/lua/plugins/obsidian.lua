vim.pack.add({
	{ src = "https://github.com/epwalsh/obsidian.nvim" },
})

local obsidian = require("obsidian")

obsidian.setup({
	ui = {
		enable = false,
	},
	workspaces = {
		{
			name = "Notes",
			path = "~/Notes",
		},
	},

	daily_notes = {
		folder = "daily",
		date_format = "%d-%m-%Y",
		alias_format = "%B %-d, %Y",
		default_tags = { "daily_notes" },
		template = nil,
	},

	mappings = {
		["<leader>of"] = {
			action = function()
				return obsidian.util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		},
	},
})
