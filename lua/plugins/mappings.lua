-- AstroCore provides a central place to modify mappings set up as well as which-key menu titles
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Partially borrowed from <https://github.com/ThePrimeagen/init.lua/blob/97c039bb88d8bbbcc9b1e3d0dc716a2ba202c6d2/lua/theprimeagen/remap.lua>.
    -- See <https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/mappings.lua> for the default settings.

    mappings = {
      -- The first key is the mode, the second key is the lefthand side of the map.
      -- See <https://neovim.io/doc/user/map.html#%3Amap-modes> for all possible modes.

      [""] = {
        ["<F1>"] = "<nop>",

        ["<LocalLeader>c"] = [["_c]],
        ["<LocalLeader>d"] = [["_d]],
        ["<LocalLeader>y"] = [["+y]],
      },

      n = {
        Q = "<nop>",
        ["<LocalLeader>C"] = [["_C]],
        ["<LocalLeader>D"] = [["_D]],
        ["<LocalLeader>Y"] = [["+Y]],

        ["<Leader>W"] = { ":noautocmd w<CR>", desc = "Save w/o formatting" },

        -- Prettify menu descriptions
        ["<Leader>gn"] = { desc = "Neogit" },
        ["<Leader>s"] = { desc = (vim.g.icons_enabled and "󰛔 " or "") .. "Search/Replace" },
        ["<Leader>T"] = { desc = (vim.g.icons_enabled and "󰙨 " or "") .. "Test" },
      },

      v = {
        ["<Leader>sz"] = { [[:sort i<CR>]], desc = "Sort lines" },
        ["<Leader>sZ"] = { [[:sort! i<CR>]], desc = "Sort lines (rev)" },
      },

      x = {
        ["<LocalLeader>p"] = [["_dP]],
      },

      i = {
        ["<C-c>"] = "<Esc>",
      },

      c = {
        ["<C-j>"] = "<C-n>",
        ["<C-k>"] = "<C-p>",
      },

      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
