---@type LazySpec
return {
  "williamboman/mason.nvim",
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
