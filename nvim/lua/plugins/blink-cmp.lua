-- require("blink.cmp").build():wait(60000)

---@module "blink.cmp"
---@type blink.cmp.Config

require("blink.cmp").setup({
	snippets = {
		preset = "luasnip",
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
		active = function(filter)
			if filter and filter.direction then
				return require("luasnip").jumpable(filter.direction)
			end
			return require("luasnip").in_snippet()
		end,
		jump = function(direction)
			require("luasnip").jump(direction)
		end,
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

-- return {
-- 	"Saghen/blink.cmp",
-- 	dependencies = {
-- 		"saghen/blink.lib",
-- 		"rafamadriz/friendly-snippets",
-- 	},
--
-- 	build = function()
-- 		require("blink.cmp").build():wait(60000)
-- 	end,
--
-- 	---@module "blink.cmp"
-- 	---@type blink.cmp.Config
--
-- 	config = function()
-- 		require("blink.cmp").setup({
-- 			snippets = {
-- 				preset = "luasnip",
-- 			},
-- 			sources = {
-- 				default = { "lsp", "path", "snippets", "buffer" },
-- 			},
-- 			fuzzy = {
-- 				implementation = "lua",
-- 			},
-- 			signature = { enabled = true },
-- 			completion = {
-- 				documentation = { auto_show = true, auto_show_delay_ms = 500 },
-- 				-- completion = {
-- 				-- 	menu = {
-- 				-- 		auto_show = true,
-- 				-- 		draw = {
-- 				-- 			treesitter = { "lsp" },
-- 				-- 			columns = { { "kind_icon", "label", "label_descrption", gap = 1 }, { "kind" } },
-- 				-- 		},
-- 				-- 	},
-- 				-- },
-- 			},
-- 		})
-- 	end,
-- }
