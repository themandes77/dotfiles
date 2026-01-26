return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = [[
			T ================================================= |T
			| ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|[L
			| __________________________________________________[|
			|I __==___________  ___________     .  ,. _ .   __  T|
			||[_j  L_I_I_I_I_j  L_I_I_I_I_j    /|/V||(g/|   ==  l|
			lI _______________________________  _____  _________I]
			 |[__I_I_I_I_I_I_I_I_I_I_I_I_I_I_] [__I__] [_I_I_I_]|
			 |[___I_I_I_I_I_I_I_I_I_I_I_I_L  I   ___   [_I_I_I_]|
			 |[__I_I_I_I_I_I_I_I_I_I_I_I_I_L_I __I_]_  [_I_I_T ||
			 |[___I_I_I_I_I_I_I_I_I_I_I_I____] [_I_I_] [___I_I_j|
			 | [__I__I_________________I__L_]                   |
					 |                                                  |  -Row
			 l__________________________________________________j
    ]]

		logo = string.rep("\n", 2) .. logo .. "\n\n"

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{
						action = "lua FzfLua.files()",
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = "lua FzfLua.zoxide()",
						desc = " Recent Directories",
						icon = " ",
						key = "r",
					},
					{
						action = "lua FzfLua.live_grep()",
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = "lua FzfLua.files({cwd = '~/NextCloud/Vimwiki'})",
						desc = " Wiki",
						icon = " ",
						key = "w",
					},
					{
						action = "Lazy",
						desc = " Lazy",
						icon = "󰒲 ",
						key = "l",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
			},
		}

		return opts
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
