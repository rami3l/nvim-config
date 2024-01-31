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

  -- NOTE: `leader` and `localleader` should be lowercase to clash with the default keybinding.

  [""] = {
    ["<F1>"] = "<nop>",

    ["<localleader>c"] = [["_c]],
    ["<localleader>d"] = [["_d]],
    ["<localleader>y"] = [["+y]],
  },

  n = {
    Q = "<nop>",
    ["<localleader>C"] = [["_C]],
    ["<localleader>D"] = [["_D]],
    ["<localleader>Y"] = [["+Y]],

    ga = { vim.lsp.buf.code_action, desc = "LSP code action" },
    gL = { require("telescope.builtin").diagnostics, desc = "Search diagnostics" },
    ["g?"] = { require("telescope").extensions["todo-comments"].todo, desc = "Search todos" },

    ["<leader>W"] = { ":noautocmd w<CR>", desc = "Save w/o formatting" },
    ["<leader>/"] = {
      require("telescope.builtin").current_buffer_fuzzy_find,
      desc = "Find words in buffer",
    },
    ["<leader>?"] = { require("telescope.builtin").live_grep, desc = "Find words" },
    ["<leader>`"] = { require("telescope.builtin").find_files, desc = "Find files" },
    ["<leader>fT"] = { require("telescope").extensions["todo-comments"].todo, desc = "Find todos" },
    ["<leader>gm"] = { require("neogit").open, desc = "Neogit dispatch" },

    -- Neotest-specific mappings
    ["<leader>T"] = { desc = (vim.g.icons_enabled and "󰙨 " or "") .. "Test" },
    ["<leader>Ts"] = { require("neotest").summary.toggle, desc = "Toggle summary" },
    ["<leader>To"] = {
      function() require("neotest").output.open { enter = true } end,
      desc = "Show output",
    },
    ["<leader>Tn"] = { require("neotest").run.run, desc = "Run nearest" },
    ["<leader>T%"] = {
      function() require("neotest").run.run(vim.fn.expand("%")) end,
      desc = "Run current file",
    },
    ["<leader>Td"] = {
      function() require("neotest").run.run { suite = false, strategy = "dap" } end,
      desc = "Debug nearest",
    },
  },

  v = {
    ga = { vim.lsp.buf.code_action, desc = "LSP code action" },

    ["<leader>sz"] = { [[:sort i<CR>]], desc = "Sort lines" },
    ["<leader>sZ"] = { [[:sort! i<CR>]], desc = "Sort lines (rev)" },
  },

  x = {
    ["<localleader>p"] = [["_dP]],
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
