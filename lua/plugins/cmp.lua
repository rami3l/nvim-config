---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      cmdline = {
        keymap = {
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
        },
      },
    },
  },

  -- Install the `copilot` language server and disable telemetry.
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "copilot-language-server" }
      )
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        copilot = {
          settings = { telemetry = { telemetryLevel = "off" } },
        },
      },
    },
  },

  -- Integrate Copilot with `blink.cmp`
  {
    "saghen/blink.cmp",
    dependencies = {
      { "fang2hou/blink-copilot", lazy = true, opts = { max_completions = 2 } },
    },
    ---@module "blink.cmp"
    ---@param opts blink.cmp.Config
    opts = function(_, opts)
      do
        local default_sources = opts.sources.default
        if type(default_sources) == "function" then default_sources = default_sources() end
        opts.sources.default =
          require("astrocore").list_insert_unique(default_sources, { "copilot" })
      end
      opts.sources.providers.copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      }
    end,
  },
}
