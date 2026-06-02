local blink = require("blink.cmp")

blink.setup({ 
  appearance = {nerd_font_variant = "mono"},
  sources = {
    default = {"lsp", "snippets", "path", "buffer"},
  },
  snippets = {
    preset = "luasnip"
  },
  keymap = {
    preset = "default",
    ["<C-y>"] = { "select_and_accept" },
    ["<C-e>"] = { "cancel" },
    ["<C-n>"] = { "select_next" },
    ["<C-p>"] = { "select_prev" },
  },
  completion = {
    documentation = {auto_show = true},
  }
})

