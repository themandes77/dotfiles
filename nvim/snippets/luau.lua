local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {

	s("fun", {
		t("function "),
		t("("),
		i(1),
		t({ ")", "\t" }),
		i(2, "-- body"),
		t({ "", "end" }),
	}),

	s(
		"do",
		fmt(
			[[
    do
      {}
    end
  ]],
			{
				i(1, "-- body"),
			}
		)
	),

	s(
		"then",
		fmt(
			[[
    then
      {}
    end
  ]],
			{
				i(1, "-- body"),
			}
		)
	),
}
