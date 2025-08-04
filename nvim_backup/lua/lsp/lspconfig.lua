local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	print("Attached to client", client.name, bufnr)

	vim.notify("Attached to client" .. client.name .. " on buffer " .. bufnr, vim.log.levels.INFO)
end

lspconfig["null-ls"].setup({})
lspconfig.cssls.setup({})
