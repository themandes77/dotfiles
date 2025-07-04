local function get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- Enable manually file watcher capability, so luau-lsp will be aware of sourcemap.json changes, this
	-- is done internally in Neovim 0.10+, but only for non Linux systems
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

	return capabilities
end

vim.lsp.config("luau-lsp", {
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
})
