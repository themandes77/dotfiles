local function rojo_project()
	return vim.fs.root(0, function(name)
		return name:match(".+%.project%.json$")
	end)
end

return {
	"lopi-py/luau-lsp.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("luau-lsp").setup({
			platform = {
				type = rojo_project() and "roblox" or "standard",
			},
			sourcemap = {
				enabled = true,
				autogenerate = true,
				rojo_project_file = "default.project.json",
				sourcemap_file = "sourcemap.json",
			},
			plugin = {
				enabled = true,
			},
		})
	end,
}
