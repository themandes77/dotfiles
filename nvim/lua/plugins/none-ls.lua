return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})
		vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>")
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.supports_method("textDocument/formatting", 0) then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function ()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end
          })
        end
      end
    })
	end,
}
