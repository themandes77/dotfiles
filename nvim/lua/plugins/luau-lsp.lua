local luau_lsp = require("luau-lsp")
luau_lsp.setup({
    platform = {
        type = "roblox",
    },
    types = {
        roblox_security_level = "PluginSecurity",
    },
    sourcemap = {
        -- based on https://argon.wiki/docs/commands/cli#sourcemap
        generator_cmd = { "argon", "sourcemap", "--watch", "--non-scripts" },
    },
    plugin = {
        enabled = true,
        port = 3667,
    },
})
