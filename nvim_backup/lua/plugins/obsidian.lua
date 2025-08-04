return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Notes",
				path = "~/Notes",
			},
		},
		notes_subdir = "inbox",
		new_notes_location = "inbox",
		attachments = {
			img_folder = "files",
		},
		daily_notes = {
			template = "note",
			date_format = "%d-%m-%Y",
		},

		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		mappings = {
			["<leader>of"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			["<leader>onn"] = {
				action = function()
					return require("obsidian").commands.new_note("Newsletter-Issue")
				end,
				opts = { buffer = true },
			},
			["<leader>ont"] = {
				action = function()
					return require("obsidian").util.insert_template("Newsletter-Issue")
				end,
				opts = { buffer = true },
			},
		},
		note_formatter_func = function(note)
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,

		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-0-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		templates = {
			subdi = "Templates",
			date_format = "%d-%m-%Y-%a",
			gtime_format = "%H:%M",
			tags = "",
		},

		picker = {
			name = "fzf-lua",
			note_mappings = {
				new = "<C-x>",
				insert_link = "<C-l>",
			},
		},
	},
}
