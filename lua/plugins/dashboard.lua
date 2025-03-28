---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard.preset.header = table.concat(require("plugins.dashboard.octahedron"), "\n")
  end,
}
