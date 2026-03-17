---@type LazySpec
return {
  -- Ported from https://github.com/AstroNvim/astrocommunity/blob/58639523ef0913005194235ebb66dc84e6b6ee05/lua/astrocommunity/pack/rust/init.lua.
  {
    "vxpm/ferris.nvim",
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lazy_ferris", { clear = true }),
        desc = "Lazy load Ferris",
        once = true,
        callback = function(args)
          if
            vim.lsp.get_client_by_id(args.data.client_id).name == "rust_analyzer"
            and require("ferris.private.config").opts.create_commands
          then
            require("ferris").create_commands(args.buf)
          end
        end,
      })
    end,
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = { enabled = true },
      },
      lsp = {
        enabled = true,
        on_attach = function(...) require("astrolsp").on_attach(...) end,
        actions = true,
        completion = true,
        hover = true,
      },
    },
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
    dependencies = {
      { "mrjones2014/codesettings.nvim", opts = {} },
    },
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        rust_analyzer = {
          before_init = function(_, cfg)
            require("codesettings")
              .loader()
              :root_dir(cfg.root_dir)
              :with_local_settings(cfg.name, cfg)
          end,
        },
      },
    },
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
