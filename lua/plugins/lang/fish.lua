---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "fish-lsp" })
    end,
  },
  -- TODO: Manual discovery of `fish_lsp` is required since `mason-lspconfig` is too old.
  -- Remove this when upgrading to AstroNvim v6+.
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = { servers = { "fish_lsp" } },
  },
}
