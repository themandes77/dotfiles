return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      defaults = {
        git_icons = false,
        file_icons = false,
        color_icons = false
      }
    end
 },
}
