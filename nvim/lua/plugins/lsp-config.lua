return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				luau_lsp = function()
					require("luau-lsp").setup({
						plugin = {
							enabled = true,
							port = 3667,
						},
						platform = {
							type = "roblox",
						},
						types = {
							roblox_security_level = "PluginSecurity",
						},
						sourcemap = {
							enabled = true,
							autogenerate = true,
							rojo_project_file = "default.project.json",
							sourcemap_file = "sourcemap.json",
						},
						server = {
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
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnipet = "Replace",
						},
					},
				},
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		end,
	},
}
