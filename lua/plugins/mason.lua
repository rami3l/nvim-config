---@type LazySpec
return {
  "mason-org/mason.nvim",
  ---@module "mason"
  ---@type MasonSettings
  opts = {
    ui = {
      keymaps = {
        uninstall_package = "x",
        toggle_help = "?",
      },
    },
  },
}
