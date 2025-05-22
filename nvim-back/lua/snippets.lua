local ok,ls = pcall(require, "luasnip")
if not ok then
  return
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f= ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  store_selection_keys = "<c-s>",
  ext_opts = {
    [types.insertNode] = {
      visited = { hl_group = "Comment" },
      unvisited = { hl_group = "Comment" }
    },
    [types.choiceNode] = {
      active = {
        virt_text = {{ "●", "Special" }}
      }
    }
  }
}

vim.keymap.set({"i", "s"}, "<C-k>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "snip jump to next placeholder" })

vim.keymap.set({"i", "s"}, "<C-j>", function ()
  if ls.expand_or_jumpable(-1) then
    ls.expand_or_jump(-1)
  end
end, { silent = true, desc = "snip jump to prev placeholder" })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { desc = "snip next choice" })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, { desc = "snip prev choice" })

local snips = {
  luau = {
    s({
      trig = "Replicated",
      name = "Import ReplicatedStorage"
    },{
        t("local ReplicatedStorage = game:GetService('ReplicatedStorage')"),
        i(0)
      }),
    s({
      trig = "Run",
      name = "Import RunService"
    },{
        t("local RunService = game:GetService('RunService')")
      })
  }
}

ls.add_snippets(nil, {
  luau = snips.luau
})
