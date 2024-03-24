-- For more examples, see: https://github.com/AstroNvim/template/blob/main/lua/plugins/lsp.lua
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = true,

      inlay_hints = false,
      lsp_handlers = true,
      semantic_tokens = true,
    },

    formatting = {
      format_on_save = { enabled = true },
      timeout_ms = 1000,
    },

    -- enable servers that you already have installed without mason
    servers = {},

    ---@diagnostic disable: missing-fields
    config = {
      gopls = require("plugins.lsp.gopls"),
      rust_analyzer = require("plugins.lsp.rust_analyzer"),
    },

    mappings = {
      i = {
        ["<F2>"] = { vim.lsp.buf.rename, desc = "Rename current symbol" },
      },

      n = {
        ga = { vim.lsp.buf.code_action, desc = "LSP code action" },
        ["<F2>"] = { vim.lsp.buf.rename, desc = "Rename current symbol" },
      },

      v = {
        ga = { vim.lsp.buf.code_action, desc = "LSP code action" },
        ["<F2>"] = { vim.lsp.buf.rename, desc = "Rename current symbol" },
      },
    },
  },
}
