---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server.load_vscode_settings = true
      -- HACK: Prevent `rustaceanvim` from inheriting `root_dir` from
      -- `nvim-lspconfig` because they have incompatible signatures. Also,
      -- `rustaceanvim`'s default implementation is good enough so we are not
      -- considering overridding for now.
      opts.server.root_dir = nil
    end,
  },
  {
    "Olical/conjure",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = { options = { g = { ["conjure#filetype#rust"] = false } } },
      },
    },
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
            -- https://rust-analyzer.github.io/book/configuration.html
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
