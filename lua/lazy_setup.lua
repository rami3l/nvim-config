require("lazy").setup({
  { "AstroNvim/AstroNvim", import = "astronvim.plugins" },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration
  install = { colorscheme = { "astrodark", "habamax" } },
  performance = {
    rtp = {
      -- customize default disabled vim plugins
      disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "tarPlugin" },
    },
  },
  rocks = { enabled = false, hererocks = true },
} --[[@as LazyConfig]])
