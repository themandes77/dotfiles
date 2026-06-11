vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugin (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackUpdate", function ()
  vim.pack.update()
end, { desc = "Run vim.pack.update" })

vim.api.nvim_create_user_command("PrintCwd", function ()
    vim.print("CWD: " .. vim.fn.getcwd())
end, {desc = "Print current working directory"})

local width = math.ceil(math.min(150, vim.o.columns * 0.8))
local height = math.ceil(math.min(35, vim.o.lines * 0.5))
local row = math.ceil(vim.o.lines - height) * 0.5 - 1
local col = math.ceil(vim.o.columns - width) * 0.5 - 1

local float_config = {
    width = width,
    height = height,
    row = row,
    col = col,
    relative = "editor",
}

vim.api.nvim_create_user_command("FloatingWindow", function ()
    local buf = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_open_win(buf, true, float_config)
end, { desc = "open a floating window" })
