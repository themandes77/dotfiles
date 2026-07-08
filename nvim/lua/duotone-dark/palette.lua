local C = {}

-- Backgrounds
C.bg0      = "#19161f"   -- deepest (inactive tab bg)
C.bg1      = "#1f1c27"   -- main editor background
C.bg2      = "#353146"   -- secondary (selection, cursorline, popup)
C.bg3      = "#403c52"   -- elevated (hover, statusline active)

-- Foregrounds
C.fg0      = "#e9e4ff"   -- brightest (color15)
C.fg1      = "#b6a0ff"   -- main text (foreground)
C.fg2      = "#7a6e97"   -- dim text (comments, secondary)
C.fg3      = "#52466b"   -- muted (line numbers, gutter)

-- Accent
C.accent   = "#ff9738"   -- cursor orange
C.search   = "#ff9738"

-- ANSI colors
C.red      = "#d8393d"
C.green    = "#2dcc72"
C.yellow   = "#d8b76e"
C.blue     = "#ffc183"
C.magenta  = "#dd8d40"
C.cyan     = "#2388ff"

-- Semantic syntax aliases
C.keyword  = C.red
C.string   = C.green
C.number   = C.yellow
C.type     = C.blue
C.func     = C.cyan
C.const    = C.magenta
C.comment  = C.fg2

-- UI
C.border   = C.bg2
C.visual   = C.bg2
C.error    = C.red
C.warning  = C.yellow
C.info     = C.cyan
C.hint     = C.fg1

-- Diff
C.diff_add    = "#1e3a2a"
C.diff_change = "#3a3024"
C.diff_delete = "#3a1e22"
C.diff_add_fg    = C.green
C.diff_change_fg = C.blue
C.diff_delete_fg = C.red

-- Terminal
C.terminal_colors = {
    C.bg0,
    C.red,
    C.green,
    C.yellow,
    C.blue,
    C.magenta,
    C.cyan,
    C.fg1,
    C.bg2,
    C.red,
    C.green,
    C.yellow,
    C.blue,
    C.magenta,
    C.cyan,
    C.fg0,
}

return C
