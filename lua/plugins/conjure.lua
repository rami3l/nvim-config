---@type LazySpec
return {
  {
    "Olical/conjure",
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, { name = "conjure" })
          return cmp.setup(config)
        end,
      },
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              ["conjure#log#wrap"] = true,
              -- All these `mapping`s are prefixed by `<LocalLeader>`.
              ["conjure#mapping#doc_word"] = "gk",
            },
          },
        },
      },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings
          m.n["<LocalLeader>c"] = { desc = "Conjure connect" }
          m.n["<LocalLeader>e"] = { desc = "Conjure eval" }
          m.n["<LocalLeader>g"] = { desc = "Conjure goto" }
          m.n["<LocalLeader>k"] = { "<CMD>ConjureDocWord<CR>", desc = "Conjure doc" }
          m.n["<LocalLeader>l"] = { desc = "Conjure log" }
          m.n["<LocalLeader>r"] = { desc = "Conjure reset" }
          m.n["<LocalLeader>s"] = { desc = "Conjure session" }
          m.n["<LocalLeader>t"] = { desc = "Conjure test" }
          m.n["<LocalLeader>v"] = { desc = "Conjure view" }
          m.n["<LocalLeader>x"] = { desc = "Conjure expand" }
        end,
      },
    },
  },
}
