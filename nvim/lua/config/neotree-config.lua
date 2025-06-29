local api = require("nvim-tree.api")
vim.keymap.set("n", "<c-e>", api.tree.toggle)

local function on_attach(bufnr)
	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<c-e>", api.tree.toggle, opts("Toggle"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end
require("nvim-tree").setup({
	on_attach = on_attach,
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	actions = {
		open_file = { quit_on_open = true },
	},
	update_focused_file = {
		-- enabled = true,
		update_cwd = true,
	},
	git = {
		enable = false,
	},
})
