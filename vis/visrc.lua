require("vis")

vis.events.subscribe(vis.events.INIT, function()
	-- vis:command("set theme caelus")
end)
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command("set relativenumbers true")
	vis:command("set tabwidth 4")
	vis:command("set showspaces false")
	vis:command("set autoindent true")
	vis:command("set showtabs false")
	vis:command("set expandtab false")
	-- vis:map(vis.modes.VISUAL, " y", '"+y')
end)

require("plugins/vis-autoclose")

local lsp = require("plugins/vis-lspc")
lsp.ls_map.clangd = {
	formatting_options = {
		tabSize = 4,
		insertSpaces = false
	}
}


lsp.ls_map.lua = {
	name = "lua-language-server",
	cmd = "lua-language-server",
	lua = {
		diagnostics = { globals = {"vis"} },
		telemetry = { enabled = false }
	},
	formatting_options = {
		tabSize = 4,
		insertSpaces = false,
	}
}
