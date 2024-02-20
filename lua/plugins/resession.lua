return {
  "stevearc/resession.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local n = opts.mappings.n
        n["<Leader>Sd"] = { desc = "Delete" }
        n["<Leader>SD"] = false
      end,
    },
  },
  keys = {
    -- https://github.com/stevearc/resession.nvim/tree/master?tab=readme-ov-file#api
    {
      "<Leader>Sdf",
      function() require("resession").delete() end,
      desc = "Delete a session",
    },
    {
      "<Leader>SdF",
      function() require("resession").delete(nil, { dir = "dirsession" }) end,
      desc = "Delete a dirsession",
    },
  },
}
