return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		provider_selector = function(bufnr, filetype, buftype)
			return { "lsp", "indent" }
		end
	end,
}
