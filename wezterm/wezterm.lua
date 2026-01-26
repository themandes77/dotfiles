local wezterm = require("wezterm")
local config = wezterm.config_builder()
local tokyodark = require("themes.tokyodark")

config.color_scheme = "Dracula"

config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "fish", "tmux" }
config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = "3px"
config.cursor_blink_rate = 400
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 1,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 1,
}

config.colors = {
	visual_bell = "#202020",
}
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
