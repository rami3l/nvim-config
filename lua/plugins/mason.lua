-- Customization of mason plugins
---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- opts = function(_, opts)
    --   opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {})
    -- end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- opts = function(_, opts)
    --   opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {})
    -- end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- opts = function(_, opts)
    -- opts.ensure_installed = list_insert_unique(opts.ensure_installed, {})
    -- end,
  },
}
