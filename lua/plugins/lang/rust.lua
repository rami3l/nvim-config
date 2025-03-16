---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    ---@module "rustaceanvim"
    ---@type rustaceanvim.Opts
    opts = {
      server = { load_vscode_settings = true },
    },
  },
  {
    "Olical/conjure",
    ft = function(_, ft) return require("../utils").list_remove_all(ft, { "rust" }) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "rust_analyzer" })
    end,
  },
}
