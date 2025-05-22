local ok, ls = pcall(require, "luasnip")
if not ok then
	return
end

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	store_selection_keys = "<c-s>",
	ext_opts = {
		[types.insertNode] = {
			visited = { hl_group = "Comment" },
			unvisited = { hl_group = "Comment" },
		},
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "Special" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, desc = "snip jump to next placeholder" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.expand_or_jumpable(-1) then
		ls.expand_or_jump(-1)
	end
end, { silent = true, desc = "snip jump to prev placeholder" })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { desc = "snip next choice" })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, { desc = "snip prev choice" })

local snippets = {
	luau = {
		s("lfun", {
			t({ "local function " }),
			i(1, "name"),
			t({ "(" }),
			i(2, "params"),
			t({ ")", "\t" }),
			i(3, "-- body"),
			t({ "", "end" }),
		}),
		s("fun", {
			t({ "function" }),
			t({ "(" }),
			i(2, "params"),
			t({ ")", "\t" }),
			i(3, "-- body"),
			t({ "", "end" }),
		}),

		-- Table constructor
		s("tab", {
			t({ "local " }),
			i(1, "name"),
			t({ " = {", "\t" }),
			i(2),
			t({ "", "}" }),
		}),

		-- If statement
		s("then", {
			t({ " then", "\t" }),
			i(2),
			t({ "", "end" }),
		}),
		-- Module template
		s("module", {
			t({ "local " }),
			i(1, "module"),
			t({ " = {}", "", "", "function " }),
			i(1, "module"),
			t({ ":Init()", "\t" }),
			i(2),
			t({ "", "end", "", "return " }),
			i(1, "module"),
		}),
	},
}

ls.add_snippets(nil, {
	luau = snippets.luau,
})
