local fzf_utils = require("fzf-lua.utils")

local state = require("plugins.fzf-lua.state")
local filesystem = require("plugins.fzf-lua.filesystem")

local M = {}

M.make_item = function(file)
	local name = file.is_dir and string.format("%s/", file.name) or file.name
	local icon = nil
	local key = table.concat(
		vim.tbl_filter(function(value)
			return value
		end, { icon, name }),
		fzf_utils.nbsp
	)
	local label = table.concat(
		vim.tbl_filter(function(value)
			return value
		end, { icon, name }),
		fzf_utils.nbsp
	)
	local item = {
		key = key,
		label = label,
		file = file,
	}
	return item
end

M.get_items = function(path)
	local files = filesystem.get_files(path)
	if not state.hidden then
		files = vim.tbl_filter(function(file)
			return not file.is_hidden
		end, files)
	end
	table.sort(files, function(a, b)
		if a.type == b.type then
			return a.name:lower() < b.name:lower()
		end
		return a.is_dir
	end)
	local items = {}
	for _, file in ipairs(files) do
		local item = M.make_item(file)
		table.insert(items, item)
	end
	return items
end

return M
