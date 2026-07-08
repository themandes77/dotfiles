local duotone_dark = {}

function duotone_dark.setup()
  local C = require("duotone-dark.palette")
  require("duotone-dark.groups").setup(C)

  vim.g.terminal_color_0 = C.terminal_colors[1]
  vim.g.terminal_color_1 = C.terminal_colors[2]
  vim.g.terminal_color_2 = C.terminal_colors[3]
  vim.g.terminal_color_3 = C.terminal_colors[4]
  vim.g.terminal_color_4 = C.terminal_colors[5]
  vim.g.terminal_color_5 = C.terminal_colors[6]
  vim.g.terminal_color_6 = C.terminal_colors[7]
  vim.g.terminal_color_7 = C.terminal_colors[8]
  vim.g.terminal_color_8 = C.terminal_colors[9]
  vim.g.terminal_color_9 = C.terminal_colors[10]
  vim.g.terminal_color_10 = C.terminal_colors[11]
  vim.g.terminal_color_11 = C.terminal_colors[12]
  vim.g.terminal_color_12 = C.terminal_colors[13]
  vim.g.terminal_color_13 = C.terminal_colors[14]
  vim.g.terminal_color_14 = C.terminal_colors[15]
  vim.g.terminal_color_15 = C.terminal_colors[16]
end

return duotone_dark
