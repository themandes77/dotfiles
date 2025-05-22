---- // Lazy \\ ----
require("config.lazy")
---- // Vim options \\ ----
require("config.options")
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {
		"lua",
		"luau",
		"css",
		"c",
		"zig",
		"cpp",
	},
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	modules = {},
	sync_install = true,
	auto_install = true,
	ignore_install = {},
})

require("keymaps")
require("snippets")
require("custom-commands")
