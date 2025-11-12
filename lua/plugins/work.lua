---@type LazySpec
return {
  -- Frontend overrides
  { import = "astrocommunity.pack.angular" },
  {
    "stevearc/conform.nvim",
    optional = true,
    -- NOTE: We need to load the `lang` specs first in order to override those
    -- with the section below.
    dependencies = { { import = "plugins.lang" } },
    opts = {
      formatters_by_ft = (function()
        local javascript = { "eslint_d", "biome", stop_after_first = false }
        return {
          css = { "stylelint", "biome", stop_after_first = false },
          html = { "eslint_d" },
          htmlangular = { "eslint_d" },
          json = { "biome" },
          scss = { "stylelint" },
          javascript = javascript,
          typescript = javascript,
          markdown = { "prettierd", "prettier", stop_after_first = true },
        }
      end)(),
    },
  },

  -- Database access
  { import = "astrocommunity.pack.full-dadbod" },
  {
    "tpope/vim-dadbod",
    keys = {
      { "<Leader>B", "<Cmd>DBUIToggle<Cr>", desc = "Toggle Dadbod" },
    },
  },
  {
    "Olical/conjure",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = { options = { g = { ["conjure#filetype#sql"] = false } } },
      },
    },
  },

  -- Agentic coding
  {
    "folke/sidekick.nvim",
    event = "User AstroFile",
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>A"] =
            { desc = require("astroui").get_icon("SidekickBrain", 1, true) .. "Agent" }
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { SidekickBrain = "󰧑" } } },
    },
    keys = {
      {
        "<C-.>",
        mode = { "n", "t", "i", "x" },
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
      },
      {
        "<Leader>A<Enter>",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
      },
      {
        "<Leader>As",
        function() require("sidekick.cli").select { filter = { installed = true } } end,
        desc = "Select CLI",
      },
      {
        "<Leader>Ad",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<Leader>At",
        function() require("sidekick.cli").send { msg = "{this}" } end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<Leader>Af",
        function() require("sidekick.cli").send { msg = "{file}" } end,
        desc = "Send File",
      },
      {
        "<Leader>Av",
        mode = { "x" },
        function() require("sidekick.cli").send { msg = "{selection}" } end,
        desc = "Send Visual Selection",
      },
      {
        "<Leader>Ap",
        mode = { "n", "x" },
        function() require("sidekick.cli").prompt() end,
        desc = "Sidekick Select Prompt",
      },
      {
        "<Tab>",
        -- Try to execute the first of the following that applies:
        -- * Jump to the next NES location.
        -- * Apply the current NES.
        -- * Fall back on regular `<Tab>`.
        function() return require("sidekick").nes_jump_or_apply() and nil or "<Tab>" end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
    },
    ---@module "sidekick"
    ---@class sidekick.Config
    opts = {
      nes = { debounce = 500 },
      cli = {
        mux = { backend = "zellij", enabled = true },
        tools = { lovebird = { cmd = { "lovebird" } } },
      },
    },
  },
}
