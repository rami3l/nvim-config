local themes = {
  light = "github-monochrome-rosepine-dawn",
  dark = "kanagawa",
}

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = themes.dark,
      icons = require("plugins.ui.icons"),
      text_icons = require("plugins.ui.text_icons"),
    },
  },

  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "User AstroFile",
    specs = {
      {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = { highlights = { init = { VisualNonText = { global_link = "Visual" } } } },
      },
    },
    config = true,
  },

  -- Theming
  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = function()
      local function on_mode(mode)
        return function()
          vim.opt.background = mode
          vim.cmd.colorscheme(themes[mode])
        end
      end
      return {
        set_light_mode = on_mode("light"),
        set_dark_mode = on_mode("dark"),
      }
    end,
  },

  { "idr4n/github-monochrome.nvim", lazy = true },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      dimInactive = true,
      background = { light = "lotus", dark = "wave" },
    },
  },

  -- { "Shatur/neovim-ayu", lazy = true },
  -- { "mcchrish/zenbones.nvim", lazy = true, dependencies = { "rktjmp/lush.nvim" } },
  -- { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = true,
  --   opts = {
  --     auto_integrations = true,
  --     background = { light = "latte", dark = "mocha" },
  --   },
  -- },
  -- {
  --   "rmehri01/onenord.nvim",
  --   lazy = true,
  --   opts = {
  --     styles = { comments = "italic" },
  --   },
  -- },
}
