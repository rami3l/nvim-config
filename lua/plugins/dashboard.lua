---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = table.concat(require("plugins.dashboard.octahedron"), "\n"),
      },
    },
  },
}
