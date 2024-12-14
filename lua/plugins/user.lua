---@type LazySpec
return {
  -- Disable bundled plugins.
  { "max397574/better-escape.nvim", enabled = false },

  -- Add new user plugins below.

  -- UX enhancements
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "User Astrofile",
    opts = { keymaps = { useDefaults = true } },
  },

  {
    "mizlan/iswap.nvim",
    event = "VeryLazy",
    keys = {
      { "<Leader>rx", "<CMD>ISwapWith<CR>", desc = "Exchange syntax node" },
      { "<Leader>rX", "<CMD>IMoveWith<CR>", desc = "Shift syntax node" },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>r"] =
            { desc = require("astroui").get_icon("Refactoring", 1, true) .. "Refactor" }
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { Refactoring = "󰣪" } } },
    },
  },

  {
    "cshuaimin/ssr.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings
          local menu = m.n["<Leader>s"]
            or { desc = require("astroui").get_icon("Spectre", 1, true) .. "Search/Replace" }
          local ssr = { require("ssr").open, desc = "Structural search/replace" }

          m.n["<Leader>s"], m.x["<Leader>s"] = menu, menu
          m.n["<Leader>sr"], m.x["<Leader>sr"] = ssr, ssr
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { Spectre = "󰛔" } } },
    },
  },

  {
    "keaising/im-select.nvim",
    event = "User Astrofile",
    opts = function(_, opts)
      if vim.fn.has("macunix") == 1 then
        opts.default_im_select = "com.apple.keylayout.US"
        if vim.fn.executable("macism") == 1 then opts.default_command = "macism" end
      end
    end,
  },

  -- Additional language support
  {
    "susliko/tla.nvim",
    config = function() require("tla").setup() end,
    keys = {
      { "<Leader>lt", "<CMD>TlaTranslate<CR>", desc = "Translate PlusCal", ft = "tla" },
      { "<Leader>lT", "<CMD>TlaCheck<CR>", desc = "Check TLA+", ft = "tla" },
    },
  },
}
