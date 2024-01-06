return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      cmd = { "NullLsInstall", "NullLsUninstall" },
      opts = { handlers = {} },
    },
  },
  event = "User AstroFile",
  opts = function(_, opts)
    -- config variable is the default configuration table for the setup function call
    local nls = require("null-ls")

    opts.on_attach = require("astronvim.utils.lsp").on_attach

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    opts.sources = {
      -- Set a formatter
      nls.builtins.formatting.clang_format.with {
        disabled_filetypes = { "java" },
      },
      nls.builtins.formatting.swift_format,
      nls.builtins.formatting.swiftlint,
    }
    return opts
  end,
}
