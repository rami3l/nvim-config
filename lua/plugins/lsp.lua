-- For more examples, see: https://github.com/AstroNvim/template/blob/main/lua/plugins/lsp.lua

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = true,

      inlay_hints = true,
      lsp_handlers = true,
      semantic_tokens = true,
    },

    formatting = {
      format_on_save = { enabled = true },
      timeout_ms = 1000,
    },

    ---@diagnostic disable: missing-fields
    config = {
      harper_ls = require("plugins.lsp.harper_ls"),
    },

    mappings = {
      i = {
        ["<F2>"] = { vim.lsp.buf.rename, desc = "Rename current symbol" },
      },

      n = {
        ga = { vim.lsp.buf.code_action, desc = "LSP code action" },
        ["<F2>"] = { vim.lsp.buf.rename, desc = "Rename current symbol" },

        ["<Leader>lc"] = { vim.lsp.buf.outgoing_calls, desc = "Outgoing calls" },
        ["<Leader>lC"] = { vim.lsp.buf.incoming_calls, desc = "Incoming calls" },
      },

      v = {
        ga = { vim.lsp.buf.code_action, desc = "LSP code action" },
        ["<F2>"] = { vim.lsp.buf.rename, desc = "Rename current symbol" },
      },
    },
  },
}
