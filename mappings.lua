-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

-- Partially borrowed from <https://github.com/ThePrimeagen/init.lua/blob/97c039bb88d8bbbcc9b1e3d0dc716a2ba202c6d2/lua/theprimeagen/remap.lua>.
-- See <https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/mappings.lua> for the default settings.

return {
  -- The first key is the mode, the second key is the lefthand side of the map.
  -- See <https://neovim.io/doc/user/map.html#%3Amap-modes> for all possible modes.

  n = {
    -- Remappings for common operations.
    Q = "<nop>",
    ["<LocalLeader>c"] = [["_c]],
    ["<LocalLeader>C"] = [["_C]],
    ["<LocalLeader>d"] = [["_d]],
    ["<LocalLeader>D"] = [["_D]],
    ["<LocalLeader>y"] = [["+y]],
    ["<LocalLeader>Y"] = [["+Y]],

    -- Extra mappings.
    ga = { vim.lsp.buf.code_action, desc = "LSP code action" },
    gL = { require("telescope.builtin").diagnostics, desc = "Search diagnostics" },

    -- `which-key` mappings.
    ["<Leader>/"] = { require("telescope.builtin").live_grep, desc = "Find words" },
    ["<Leader>`"] = { require("telescope.builtin").find_files, desc = "Find files" },
    ["<Leader>gm"] = { require("neogit").open, desc = "Neogit dispatch" },
  },

  v = {
    ["<LocalLeader>c"] = [["_c]],
    ["<LocalLeader>d"] = [["_d]],
    ["<LocalLeader>y"] = [["+y]],
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
}
