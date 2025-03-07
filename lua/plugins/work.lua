---@type LazySpec
return {
  { import = "astrocommunity.editing-support.codecompanion-nvim" },

  { import = "astrocommunity.pack.moonbit" },
  {
    "moonbit-community/moonbit.nvim",
    -- dir = "<path>",
  },

  { import = "astrocommunity.pack.ocaml" },
  { "tjdevries/ocaml.nvim", enabled = false },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("utils").list_remove_all(opts.ensure_installed, { "ocamllsp" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("utils").list_remove_all(opts.ensure_installed, { "ocaml-lsp" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = { servers = { "ocamllsp" } },
  },
}
