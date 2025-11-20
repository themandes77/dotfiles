return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["%"] = function()
				local oil = require("oil")
				local name = vim.fn.input("New file: ", oil.get_current_dir())

				if name ~= "" then
					vim.fn.writefile({}, name)
					oil.save({
						confirm = true,
					})
					vim.cmd("edit " .. name)
				end
			end,
			["d"] = function()
				local oil = require("oil")
				local name = vim.fn.input("New directory: ", oil.get_current_dir())

				if name ~= "" then
					vim.fn.mkdir(name, "p")
					oil.save({
						confirm = true,
					})
				end
			end,
			["D"] = function()
				local oil = require("oil")
				local entry = oil.get_cursor_entry()
				if not entry then
					return
				end

				local path = entry.name
				local full_path = oil.get_current_dir() .. path

				local confirm = vim.fn.input("Delete '" .. path .. "'? [y/N]: ")
				if confirm:lower() ~= "y" then
					return
				end

				if entry.type == "directory" then
					vim.fn.delete(full_path, "rf")
				else
					vim.fn.delete(full_path)
				end

				oil.save({
					confirm = true,
				})
			end,
		},

		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}
