---@type LazySpec
return {
  {
    "Olical/conjure",
    specs = {
      {
        "Saghen/blink.cmp",
        optional = true,
        dependencies = { "PaterJason/cmp-conjure" },
        specs = { { "Saghen/blink.compat", lazy = true } },
        opts = function(_, opts)
          opts.sources.default =
            require("astrocore").list_insert_unique(opts.sources.default, { "cmp-conjure" })
          opts.sources.providers["cmp-conjure"] = {
            name = "conjure",
            module = "blink.compat.source",
            score_offset = 100,
            async = true,
          }
        end,
      },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings
          m.n["<LocalLeader>c"] = { desc = "Conjure connect" }
          m.n["<LocalLeader>e"] = { desc = "Conjure eval" }
          m.n["<LocalLeader>g"] = { desc = "Conjure goto" }
          m.n["<LocalLeader>k"] = { "<Cmd>ConjureDocWord<Cr>", desc = "Conjure doc" }
          m.n["<LocalLeader>l"] = { desc = "Conjure log" }
          m.n["<LocalLeader>r"] = { desc = "Conjure reset" }
          m.n["<LocalLeader>s"] = { desc = "Conjure session" }
          m.n["<LocalLeader>t"] = { desc = "Conjure test" }
          m.n["<LocalLeader>v"] = { desc = "Conjure view" }
          m.n["<LocalLeader>x"] = { desc = "Conjure expand" }
        end,
      },
    },
    dependencies = {
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
    },
  },
}
