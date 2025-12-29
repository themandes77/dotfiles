local wezterm = require("wezterm")
local config = wezterm.config_builder()
local tokyodark = require("themes.tokyodark")

config.colors = tokyodark

config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "fish", "tmux" }
config.keys = {
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

config.font = wezterm.font("DepartureMono Nerd Font")
config.font_size = 17

config.tab_and_split_indices_are_zero_based = false

config.use_fancy_tab_bar = false

return config
