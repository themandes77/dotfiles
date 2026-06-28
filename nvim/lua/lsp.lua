---- // Config LSPs \\ ----
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
      workspace = {
        library = vim.list_extend(
          vim.api.nvim_get_runtime_file("", true),
          { "/usr/share/hypr/stubs" }
        ),
        checkThirdParty = false,
        telemetry = { enable = false },
			diagnostics = { globals = { "hl", "vim" } },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = 2,
          },
        },
      },
		},
	},
}

vim.lsp.config["marksman"] = {
	cmd = { "marksman" },
	filetypes = { "markdown", "markdown.md" },
	root_markers = { ".marksman.toml", ".git" },
}

vim.lsp.config["luau_lsp"] = {
	filetypes = { "luau" },
    settings = {
        ["luau-lsp"] = {
            completion = {
                fillCallArguments = false, -- disable arguments snippets when completing a function call
            },
        },
    },
}

vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
}

vim.lsp.config["qmlls"] = {
    cmd = {"qmlls", "-I", "/usr/lib64/qt6/qml"},
    filetypes = {"qml", "qmljs"},
    root_markers = { '.git' },
}

vim.lsp.config["ast_grep"] = {
    cmd = { 'ast-grep', 'lsp' },
    workspace_required = true,
    reuse_client = function(client, config)
        config.cmd_cwd = config.root_dir
        return client.name == config.name and client.config.cmd_cwd == config.cmd_cwd
    end,
    filetypes = { -- https://ast-grep.github.io/reference/languages.html
        'css',
        'elixir',
        'go',
        'haskell',
        'html',
        'java',
        'javascript',
        'javascriptreact',
        'json',
        'kotlin',
        'nix',
        'php',
        'ruby',
        'rust',
        'scala',
        'solidity',
        'swift',
        'typescript',
        'typescriptreact',
        'yaml',
    },
    root_markers = { 'sgconfig.yaml', 'sgconfig.yml' },
}

vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}

---- // Enable LSPs \\ ----

vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("clangd")
vim.lsp.enable("qmlls")
vim.lsp.enable("luau_ls")
vim.lsp.enable("ast_grep")
vim.lsp.enable("ts_ls")

---- // Autocommands \\ ----
vim.api.nvim_create_autocmd("FileType", {
  callback = function ()
    pcall(vim.treesitter.start)
  end
})

