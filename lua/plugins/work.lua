---@type LazySpec
return {
  { import = "astrocommunity.pack.java" }, -- astrocommunity.pack.java
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "google-java-format",
      })
      opts.handlers.clang_format = function()
        nls.register {
          nls.builtins.formatting.clang_format.with {
            disabled_filetypes = { "java" },
          },
        }
      end
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = { format = { enabled = false } },
      },
    },
  },

  { import = "astrocommunity.pack.moonbit" },
  { import = "astrocommunity.pack.ocaml" },
}
