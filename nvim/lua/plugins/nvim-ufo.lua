local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}

for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
		-- you can add other fields for setting up lsp server in this table
	})
end

-- vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#555555", bg = "NONE" })

vim.opt.foldcolumn = "auto:9"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.fillchars:append({
	foldopen = "", -- top of open fold 
	foldclose = "", -- closed fold indicator 
	foldsep = "│", -- the vertical lines (try "┆", "·", or "│")
	fold = " ", -- background
})

require("ufo").setup({})
