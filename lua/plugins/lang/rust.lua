---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^8",
    dependencies = { "mrjones2014/codesettings.nvim" },
    opts = function(_, opts)
      -- HACK: Prevent `rustaceanvim` from inheriting `root_dir` from
      -- `nvim-lspconfig` because they have incompatible signatures. Also,
      -- `rustaceanvim`'s default implementation is good enough so we are not
      -- considering overridding for now.
      opts.server.root_dir = nil

      ---@type table | (fun(project_root:string|nil, default_settings: table|nil):table)
      opts.server.settings = function(project_root, default_settings)
        local astrolsp_opts = vim.lsp.config["rust_analyzer"] or {}
        local astrolsp_settings = astrolsp_opts.settings or {}

        local merge_table =
          require("astrocore").extend_tbl(default_settings or {}, astrolsp_settings)

        -- Merge the final settings from `rustaceanvim`, and then `codesettings` if available.
        local settings =
          require("rustaceanvim.config.server").load_rust_analyzer_settings(project_root, {
            settings_file_pattern = "rust-analyzer.json",
            default_settings = merge_table,
          })

        -- HACK: Redirect `files.excludeDirs` override in the astrocommunity pack.
        if settings["rust-analyzer"] and settings["rust-analyzer"].files then
          settings["rust-analyzer"].files.exclude = settings["rust-analyzer"].files.excludeDirs
            or {}
          settings["rust-analyzer"].files.excludeDirs = nil
        end

        local codesettings_avail, codesettings = pcall(require, "codesettings")
        if codesettings_avail then
          settings =
            codesettings.with_local_settings("rust-analyzer", { settings = settings }).settings
        end
        return settings
      end
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
