local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
assert(vim.uv.fs_stat(lazypath))
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({ 'markdown', 'markdown_inline' })
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('Highlighter', {}),
                pattern = 'markdown',
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('render-markdown').setup({})
        end,
    },
})
