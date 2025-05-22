vim.api.nvim_create_user_command("Snippets", function()
  local uname = vim.loop.os_uname()
  if uname.sysname:lower():find("windows") then
    local path = vim.fn.expand('~/AppData/Local/nvim/lua/snippets.lua')
    vim.cmd('edit '..path)
  elseif uname.sysname:lower():find("linux") then
  end
end, {})
