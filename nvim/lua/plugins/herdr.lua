local M = {}

function M.setup()
  vim.cmd("packadd herdr.nvim")
  require("herdr").setup({ helper = "herdr-navigator" })
end

M.setup()

return M
