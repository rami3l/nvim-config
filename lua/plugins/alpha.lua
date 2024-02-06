return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.header.val = require("plugins.alpha.octahedron")
    return opts
  end,
}
