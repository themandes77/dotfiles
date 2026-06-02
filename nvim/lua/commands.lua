vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugin (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackUpdate", function ()
  vim.pack.update()
end, { desc = "Run vim.pack.update" })

vim.api.nvim_create_user_command("PrintCwd", function ()
    vim.print("CWD: " .. vim.fn.getcwd())
end, {desc = "Print current working directory"})
