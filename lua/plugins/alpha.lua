---@type LazySpec
return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.header.val = require("plugins.alpha.saturn")
    return opts
  end,
}
