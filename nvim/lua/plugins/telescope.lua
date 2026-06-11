local fb_actions = require("telescope").extensions.file_browser.actions
local tele_action = require("telescope.actions")
require("telescope").setup({
    extensions = {
        file_browser = {
            theme = "ivy",
            mappings = {
                ["i"] = {
                    ["<C-g>"] = function ()
                        local bufnr = vim.api.nvim_get_current_buf()
                        tele_action.close(bufnr)
                    end,
                },
                ["n"] = {},
            }
        }
    }
})

require("telescope").load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser<CR>", {desc = "open telescope filebrowser"})
