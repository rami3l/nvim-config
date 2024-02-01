-- Example customization of Null-LS sources
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "davidmh/cspell.nvim",
  },
  opts = function(_, opts)
    -- config variable is the default configuration table for the setup function call
    local nls = require("null-ls")

    opts.on_attach = require("astrolsp").on_attach

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    opts.sources = {
      require("cspell").code_actions,
      require("cspell").diagnostics.with {
        -- https://github.com/davidmh/cspell.nvim/issues/13
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity["INFO"]
        end,
      },
      nls.builtins.formatting.clang_format.with {
        disabled_filetypes = { "java" },
      },
      nls.builtins.formatting.swift_format,
      nls.builtins.formatting.swiftlint,
    }
    return opts
  end,
}
