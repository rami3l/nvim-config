-- Example customization of Null-LS sources
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- config variable is the default configuration table for the setup function call
    local nls = require("null-ls")

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    opts.sources = {
      nls.builtins.formatting.swift_format,
      nls.builtins.formatting.swiftlint,
    }
    return opts
  end,
}
