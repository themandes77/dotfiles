local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'tokyonight-storm'

config.default_prog = {"pwsh.exe"}
config.font = wezterm.font('ProggyClean CE Nerd Font Mono')
config.font_size = 20
config.max_fps = 144
config.animation_fps = 144

config.tab_and_split_indices_are_zero_based = false

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle

local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle
local SLASH = wezterm.nerdfonts.fae_slash
local ARROW_EXPAND_RIGHT = wezterm.nerdfonts.md_arrow_expand_right

local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end
config.use_fancy_tab_bar = false
config.tab_max_width = 1600

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
  local edge_background = "#2a2a40"
  local background =  "#2a2a40"
  local foreground = "#808080"

  if tab.is_active then
    background = "#0a0a23"
    foreground = "#c0c0c0"
  elseif hover then
    background = "#1b1b32"
    foreground = "#909090"
  end

  local edge_foreground = background
  local title = tab_title(tab)

  title = wezterm.truncate_right(title, max_width - 2)

  return {
    {Background = {Color = edge_background}},
    {Foreground = {Color  = edge_foreground}},
    {Text = SOLID_LEFT_ARROW},
    { Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = "  " .. tab.tab_index + 1 .. " " .. ARROW_EXPAND_RIGHT .. " " .. title .. "  " },
		{ Background = { Color = edge_foreground } },
		{ Foreground = { Color = "#909090" } },
		{ Text = SLASH },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
  }
end)

return config
