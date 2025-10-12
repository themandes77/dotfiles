vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})
local highlight = {
	"CursorColumn",
	"Whitespace",
}
require("ibl").setup({
	scope = {
		enabled = true,
	},
})
