return {
  "L3MON4D3/LuaSnip",
  -- https://docs.astronvim.com/recipes/snippets
  config = function(plugin, opts)
    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load {
      -- this can be used if your configuration lives in ~/.config/nvim
      -- if your configuration lives in ~/.config/astronvim, the full path
      -- must be specified in the next line
      paths = { "./lua/user/snippets" },
    }
  end,
}
