require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    -- Remove version tracking to elect for nightly AstroNvim
    version = "^4",
    import = "astronvim.plugins",
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration
  install = { colorscheme = { "astrodark", "habamax" } },
  performance = {
    rtp = {
      -- customize default disabled vim plugins
      disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },
} --[[@as LazyConfig]])
