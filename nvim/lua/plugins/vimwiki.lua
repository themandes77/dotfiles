return {
	"vimwiki/vimwiki",
	config = function()
		vim.g.vimwiki_list = { { syntax = "markdown", ext = ".md" } }
	end,
}
