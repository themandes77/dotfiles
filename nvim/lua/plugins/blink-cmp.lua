return {
	"Saghen/blink.cmp",
	config = function()
		require("blink.cmp").setup({
			snippets = {
				preset = "luasnip",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				implementation = "lua",
			},
			signature = { enabled = true },
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				-- completion = {
				-- 	menu = {
				-- 		auto_show = true,
				-- 		draw = {
				-- 			treesitter = { "lsp" },
				-- 			columns = { { "kind_icon", "label", "label_descrption", gap = 1 }, { "kind" } },
				-- 		},
				-- 	},
				-- },
			},
		})
	end,
}
