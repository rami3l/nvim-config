---@type LazySpec
return {
  {
    "Olical/conjure",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              ["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true,
              ["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true,
              ["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "lein repl",
            },
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "joker",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        clojure = { "joker", stop_after_first = true, lsp_format = "fallback" },
        clojurescript = { "joker", stop_after_first = true, lsp_format = "fallback" },
      },
    },
  },
}
