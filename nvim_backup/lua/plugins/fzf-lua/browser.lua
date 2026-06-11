local fzf = require("fzf-lua")

local state = require("plugins.fzf-lua.state")
local utils = require("plugins.fzf-lua.utils")
local actions = require("plugins.fzf-lua.actions")
local previewer = require("plugins.fzf-lua.previewer")

local M = {}

M.browse = function(opts)
	opts = opts or {}
	state.cwd = opts.cwd or vim.fn.expand("%:p:h") or vim.uv.cwd()
	state.active = vim.fn.expand("%:t")
	local fzf_args = {
		"--sync",
		"--bind change:first",
	}
	local prompt = "Files> "
	local items = utils.get_items(state.cwd)
	state.files = {}
	local lines = {}

	-- Add ../ at the top for parent directory navigation
	table.insert(lines, "../")

	for i, item in ipairs(items) do
		table.insert(lines, item.label)
		state.files[item.key] = item.file
		if item.file.name == state.active then
			table.insert(fzf_args, string.format("--bind start:pos\\(%s\\)", i + 1))
		end
	end
	fzf.fzf_exec(function(callback)
		for _, line in ipairs(lines) do
			callback(line)
		end
		callback()
	end, {
		actions = actions.get_actions(M, state),
		browser = M,
		cwd = state.cwd,
		fzf_args = table.concat(fzf_args, " "),
		previewer = previewer,
		prompt = prompt,
		winopts = {
			title = " File Browser ",
		},
	})
end

return M
