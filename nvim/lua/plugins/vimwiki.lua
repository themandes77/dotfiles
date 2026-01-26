return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				syntax = "markdown",
				path = "~/NextCloud/Vimwiki",
				ext = ".md",
			},
		}
		vim.g.vimwiki_conceallevel = 0
		vim.g.vimwiki_global_ext = 0
	end,
}
