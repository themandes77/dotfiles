vim.lsp.enable({ "lua_ls", "clangd" })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
--
-- 		if not client:supports_method('textDocument/willSaveWaitUntil')
-- 				and client:supports_method('textDocument/formatting') then
-- 			vim.api.nvim_create_autocmd('BufWritePre', {
-- 				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
-- 				buffer = ev.buf,
-- 				callback = function()
-- 					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
-- 				end,
-- 			})
-- 		end
-- 	end
-- })
-- vim.cmd("set completeopt+=noselect")

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
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
