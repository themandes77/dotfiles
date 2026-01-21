require("options")
-- require("plugins")
require("config.lazy")
require("lsp")
require("keybinds")

if vim.g.neovide then
	vim.print(vim.g.neovide_version)
	vim.o.guifont = "DepartureMono Nerd Font:h15"
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
end
