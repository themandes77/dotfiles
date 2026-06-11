local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"pack",
		fmt(
			[[
				{{ src = "https://github.com/{}"}},
			]],
			{
				i(1, "-- package"),
			}
		)
	),
}
