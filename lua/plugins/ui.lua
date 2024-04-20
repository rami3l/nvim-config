---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "ayu-mirage",
      icons = require("plugins.ui.icons"),
      text_icons = require("plugins.ui.text_icons"),
    },
  },

  -- Theming
  { "Shatur/neovim-ayu", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },

  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd.colorscheme("onedark")
      end,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("ayu-mirage")
      end,
    },
  },
}
