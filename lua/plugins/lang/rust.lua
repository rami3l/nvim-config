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
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "rust-analyzer" })
    end,
  },

  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        rust_analyzer = {
          settings = {
            -- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
              check = { command = "clippy" },
              completion = {
                postfix = { enable = true },
              },
              imports = {
                granularity = { enforce = true },
                prefix = "self",
              },
              inlayHints = {
                closureReturnTypeHints = { enable = "with_block" },
                expressionAdjustmentHints = { enable = "reborrow", hideOutsideUnsafe = true },
                lifetimeElisionHints = { enable = "skip_trivial", useParameterNames = true },
                typeHints = { hideClosureInitialization = true },
              },
              procMacro = { enable = true },
              rustfmt = { extraArgs = { "+nightly" } },
              workspace = {
                symbol = { search = { kind = "all_symbols", limit = 512 } },
              },
            },
          },
        },
      },
    },
  },
}
