local fzf = require("fzf-lua")
local km = vim.keymap
local browser = require("plugins.fzf-lua.browser")

km.set("n", ";f", browser.browse, { desc = "find files" })
km.set("n", ";w", "<cmd>FzfLua files cwd=~/NextCloud/Vimwiki/<CR>")
km.set("n", "\\\\", fzf.buffers)
km.set("n", ";e", fzf.diagnostics_document)
km.set("n", ";s", fzf.live_grep)
km.set("n", ";vh", fzf.helptags, { desc = "Search help APIs" })

km.set("n", ";o", function()
	fzf.files({ cwd = "/home/mandes/Notes" })
end, { desc = "open obsidian vault" })
