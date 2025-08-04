vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("luasnip.loaders.from_lua").lazy_load({
	paths = vim.fn.stdpath("config") .. "/snippets",
})
