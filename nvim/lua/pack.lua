-- templates
-- "https://github.com/
-- { src = "https://github.com/ }

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "blink.cmp" and (ev.data.kind == "install" or ev.data.kind == "update") then
			require("blink.cmp").build():wait(60000)
		end
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "LuaSnip" and (ev.data.kind == "install" or ev.data.kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({

	-- none-ls
	{ src = "https://github.com/nvimtools/none-ls.nvim" },

	-- Mason
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- autopairs
	{ src = "https://github.com/windwp/nvim-autopairs" },

	-- blink-cmp
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },

	-- tmux-navigator
	"https://github.com/christoomey/vim-tmux-navigator",

	-- fzf-lua
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- oil.nvim
	{ src = "https://github.com/stevearc/oil.nvim" },

	-- lsp-config
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	-- luau-lsp
	{ src = "https://github.com/lopi-py/luau-lsp.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	-- flash
	{ src = "https://github.com/folke/flash.nvim" },

	-- lua-line
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- folding
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },
	{ src = "https://github.com/kevinhwang91/promise-async" },

	-- Dashboard
	{ src = "https://github.com/nvimdev/dashboard-nvim" },

	-- luasnip
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.*" },

	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- vimwiki
	{ src = "https://github.com/vimwiki/vimwiki" },

	-- render-markdown
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- img-clip
	{ src = "https://github.com/HakonHarnes/img-clip.nvim" },

	-- colors
	"https://github.com/Mofiqul/dracula.nvim",
})

vim.api.nvim_create_user_command("PackCheck", function()
	local non_active = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()

	if #non_active == 0 then
		vim.notify("🆗 No non-active plugins found!", vim.log.levels.INFO)
		return
	end

	vim.print("😴 Non-active plugins :")
	print(" ")
	-- vim.print(non_active)
	for _, name in ipairs(non_active) do
		print(name)
	end

	print(" ")

	local choice = vim.fn.confirm(
		"Delete ALL non-active plugins from disk?",
		"&Yes\n&No",
		2 -- default = No
	)

	if choice == 1 then
		vim.pack.del(non_active)
		vim.notify("🗑️  Deleted " .. #non_active .. " non-active plugin(s)", vim.log.levels.INFO)
		print("Non-active plugins deleted!")
		vim.api.nvim_exec_autocmds("User", { pattern = "PackChanged" })
	else
		vim.notify("Cancelled. No plugins were deleted!", vim.log.levels.INFO)
	end
end, { desc = "List non active plugins and select to delete" })

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Update all plugins" })
-- CONFIGS --
local dracula = require("dracula")
dracula.setup({
	transparent_bg = true,
})

vim.cmd("colorscheme dracula") -- colorscheme

require("plugins.autopairs") -- autopairs
require("plugins.lualine") -- lualine
require("plugins.oil") -- oil
require("plugins.nonels") -- nonels
-- lsp stuff --
require("plugins.mason") -- mason
require("lsp") -- lsp
require("plugins.luasnip") -- luasnip

require("plugins.nvim-ufo") -- nvim-ufo
require("plugins.blink-cmp") -- blink-cmp
