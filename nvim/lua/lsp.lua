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

local function get_python_path()
  if vim.env.VIRTUAL_ENV then
    return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
  end
  if vim.env.CONDA_PREFIX then
    return vim.fs.joinpath(vim.env.CONDA_PREFIX, "bin", "python")
  end
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

vim.lsp.config["basedpyright"] = {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  on_new_config = function(new_config)
    new_config.settings = vim.tbl_deep_extend("force", new_config.settings or {}, {
      python = { pythonPath = get_python_path() },
    })
  end,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}

---- // Enable LSPs \\ ----

vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("clangd")
vim.lsp.enable("qmlls")
vim.lsp.enable("luau_ls")
vim.lsp.enable("ast_grep")
vim.lsp.enable("ts_ls")
vim.lsp.enable("basedpyright")

---- // Autocommands \\ ----
vim.api.nvim_create_autocmd("FileType", {
  callback = function ()
    pcall(vim.treesitter.start)
  end
})

