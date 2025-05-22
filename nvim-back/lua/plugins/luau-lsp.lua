local function rojo_project()
	return vim.fs.root(0, function(name)
		return name:match(".+%.project%.json$")
	end)
end
local function get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- Enable manually file watcher capability, so luau-lsp will be aware of sourcemap.json changes, this
	-- is done internally in Neovim 0.10+, but only for non Linux systems
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

	return capabilities
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
			server = {
				capabilities = get_capabilities(),
				settings = {
					["luau-lsp"] = {
						completion = {
							imports = {
								enabled = true,
							},
						},
					},
				},
			},
		})
	end,
}
