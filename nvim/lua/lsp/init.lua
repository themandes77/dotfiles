-- luau lsp
require("luau-lsp").setup({
	platform = {
		type = "roblox",
	},
	types = {
		roblox_security_leve = "PluginSecurity",
	},
	sourcemap = {
		enabled = true,
		autogenerate = true,
		rojo_project_file = "default.project.json",
		sourcemap_file = "sourcemap.json",
	},
	plugin = {
		enabled = true,
		port = 3667,
	},
})

vim.lsp.config("luau-lsp", {
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

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = {
					vim.api.nvim_get_runtime_file("", true),
					"${3rd}/love2d/library",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {})

vim.lsp.enable({ "lua_ls", "clangd" })
