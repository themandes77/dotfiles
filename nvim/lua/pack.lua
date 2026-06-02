vim.pack.add({
    {src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*")},  -- saghen/blink-cmp
    {src = "https://github.com/L3MON4D3/LuaSnip"},  -- L3MON4D3/LuaSnip
    {src = "https://github.com/windwp/nvim-autopairs"}, -- windwp/nvim-autopairs
    {src = "https://github.com/folke/which-key.nvim"},  -- folke/which-key
    {src = "https://github.com/catppuccin/nvim"}, -- cattppuccin/nvim
    -- {src = "https://github.com/lervag/wiki.vim"}, -- lervag/wiki.vim
    {src = "https://github.com/vimwiki/vimwiki"}, -- vimwiki
    {src = "https://github.com/mason-org/mason.nvim"},  --mason.nvim
    {src = "https://github.com/MeanderingProgrammer/render-markdown.nvim"}, -- MeanderingProgrammer/render-markdown
    {src = "https://github.com/nvim-lua/plenary.nvim"}, -- nvim-lua/plenary.nvim
    {src = "https://github.com/nvim-treesitter/nvim-treesitter"}, -- nvim-treesitter/nvim-treesitter
    {src = "https://github.com/nvim-tree/nvim-web-devicons"}, -- nvim-tre/nvim-web-devicons
    {src = "https://github.com/j-hui/fidget.nvim"}, -- j-hui/fidget.nvim
    {src = "https://github.com/themandes77/ibuff.nvim"}, -- themandes77/ibuff.nvim
    {src = "https://github.com/ellisonleao/gruvbox.nvim"},  --gruvbox colorscheme
    {src = "https://github.com/nvim-lualine/lualine.nvim"}, --lualine
    {src = "https://github.com/kevinhwang91/nvim-ufo"}, --ufo
    {src = "https://github.com/kevinhwang91/promise-async"},
    {src = "https://github.com/stevearc/oil.nvim"}, --oil.nvim
    {src = "https://github.com/guillermodotn/nvim-earthsong"}, --earthsong colorscheme
    {src = "https://github.com/Pearljak/terracotta.nvim"},  --terracota colorscheme
    {src = "https://github.com/lopi-py/luau-lsp.nvim"}, --luau-lsp
    {src = "https://github.com/preservim/nerdtree"}, -- nerdtree
    {src = "https://github.com/lukas-reineke/indent-blankline.nvim"}, -- indent blankline
    {src = "https://github.com/sainnhe/gruvbox-material"},
})

require("plugins.autopairs") -- autopairs
require("plugins.blink-cmp") -- blink-cmp
require("plugins.oil") -- oil-nvim
require("plugins.luasnip") -- luasnip
require("plugins.wikivim") -- wikivim
require("plugins.render-markdown") -- render-markdown
require("plugins.treesitter") -- treesitter
require("plugins.mason") -- mason
require("plugins.fidget") -- fidget
require("plugins.ibuff") -- ibuff
require("plugins.nvim-ufo") -- nvim-ufo
require("plugins.lualine")
require("plugins.luau-lsp")
require("plugins.nerdtree")
require("plugins.ibl")

vim.cmd.colorscheme("gruvbox")
