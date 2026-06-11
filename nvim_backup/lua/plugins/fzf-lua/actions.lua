-- local fzf_actions = require("fzf-lua.actions")
local fzf_path = require("fzf-lua.path")

local filesystem = require("plugins.fzf-lua.filesystem")
local state = require("plugins.fzf-lua.state")

local M = {}

M.get_actions = function(browser_mod, state_mod)
	return {
		["default"] = function(selected, opts)
			local key = selected[1]
			if key == "../" then
				local parent = vim.fn.fnamemodify(state_mod.cwd, ":h")
				if parent and parent ~= state_mod.cwd then
					browser_mod.browse({ cwd = parent })
				end
				return
			end
			local file = state_mod.files[key]
			if not file then
				return
			end
			if file.is_dir then
				browser_mod.browse({ cwd = file.path })
			else
				vim.cmd.edit(file.path)
			end
		end,
		["%"] = function(_, opts) -- create file
			local cwd = opts.cwd or state_mod.cwd
			vim.ui.input({
				prompt = "New path: ",
				default = fzf_path.add_trailing(cwd),
			}, function(path)
				if not path then
					return
				end
				local exists = filesystem.exists(path)
				if exists then
					vim.notify("File already exists.", vim.log.levels.ERROR)
					return
				end
				filesystem.create(path)
				state_mod.active = fzf_path.basename(path)
				browser_mod.browse({ cwd = cwd })
			end)
		end,
		["ctrl-r"] = function(selected, opts) -- rename file
			if vim.tbl_isempty(selected) then
				return
			end
			local key = selected[1]
			if key == "../" then
				return
			end
			local file = state_mod.files[key]
			if not file then
				return
			end
			vim.ui.input({
				prompt = "New path: ",
				default = file.path,
			}, function(path)
				if not path then
					return
				end
				if path == file.path then
					return
				end

				local exists = filesystem.exists(path)
				if exists then
					return
				end

				file:rename(path)
				local buf = vim.fn.bufnr(file.path)
				if buf ~= -1 then
					vim.api.nvim_buf_set_name(buf, path)
					vim.api.nvim_buf_call(buf, function()
						vim.api.nvim_command("silent! w!")
					end)
				end
				state_mod.active = fzf_path.basename(path)
				browser_mod.browse({ cwd = state_mod.cwd })
			end)
		end,
		["ctrl-d"] = function(selected, opts) -- delete
			if vim.tbl_isempty(selected) then
				return
			end
			local key = selected[1]
			if key == "../" then
				vim.notify("Cannot delete parent directory entry", vim.log.levels.WARN)
				return
			end
			local file = state_mod.files[key]
			if not file then
				return
			end
			vim.ui.prompt({
				prompt = string.format("Delete %s? [y/n]: ", file.name),
			}, function(input)
				if input ~= "y" then
					return
				end
				file:delete()
				local current = vim.fn.bufnr(file.path)
				if current ~= -1 then
					local wins = vim.fn.win_findbuf(current)
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_create_buf(false, false)
						vim.api.nvim_win_set_buf(win, buf)
					end
					vim.api.nvim_buf_delete(current, {
						force = true,
					})
				end
				browser_mod.browse({ cwd = state_mod.cwd })
			end)
		end,
	}
end

return M
