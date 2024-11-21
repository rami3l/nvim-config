local light_theme, dark_theme = "astrolight", "catppuccin"

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = dark_theme,
      icons = require("plugins.ui.icons"),
      text_icons = require("plugins.ui.text_icons"),
    },
  },

  -- Theming
  { "Shatur/neovim-ayu", lazy = true },
  { "mcchrish/zenbones.nvim", lazy = true, dependencies = { "rktjmp/lush.nvim" } },
  { "navarasu/onedark.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      background = { light = "latte", dark = "mocha" },
    },
  },

  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd.colorscheme(light_theme)
      end,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme(dark_theme)
      end,
    },
  },

  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "User AstroFile",
    dependencies = {
      {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = { highlights = { init = {
          VisualNonText = { global_link = "Visual" },
        } } },
      },
    },
    config = true,
  },
}
