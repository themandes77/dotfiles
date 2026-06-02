local ufo = require("ufo")

vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.keymap.set("n", "zR", ufo.openAllFolds, {desc = "UFO open all folds"})
vim.keymap.set("n", "zM", ufo.closeAllFolds, {desc = "UFO, close all folds"})

ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
