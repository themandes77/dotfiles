local render_markdown = require("render-markdown")

render_markdown.setup({
  enabled = true,
  file_types = { "markdown", "vimwiki" },
  render_modes = { "n", "c", "t" },
  anti_conceal = {
    enabled = false,
  }
})

vim.treesitter.language.register('markdown', 'vimwiki')
