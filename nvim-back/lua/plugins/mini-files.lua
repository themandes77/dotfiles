return {
    "echasnovski/mini.files",
    dependencies = {
        "echasnovski/mini.icons"
    },
    config = function ()
        require("mini.files").setup()
    end,
    opts = {
        mappings = {
            go_in_plus = "<CR>",
            synchronize = "s",
            reset = ",",
            reveal_cwd = ".",
        },
        options = {
            use_as_default_explorer = true,
            permanent_delete = false
        }
    }
}
