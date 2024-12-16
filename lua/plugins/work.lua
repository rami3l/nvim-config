---@type LazySpec
return {
  { import = "astrocommunity.pack.moonbit" },

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
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = { servers = { "ocamllsp" } },
  },

  { import = "astrocommunity.pack.vue" },
}
