-- https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/" },
      mappings = {
        n = {
          ["<M-u>"] = require("telescope.actions").results_scrolling_up,
          ["<M-d>"] = require("telescope.actions").results_scrolling_down,
        },
        i = {
          ["<M-u>"] = require("telescope.actions").results_scrolling_up,
          ["<M-d>"] = require("telescope.actions").results_scrolling_down,
        },
      },
    },
    pickers = {
      find_files = { hidden = true },
      live_grep = { additional_args = { "--hidden" } },
    },
  },
  keys = {
    { "gL", require("telescope.builtin").diagnostics, desc = "Search diagnostics" },
    {
      "<Leader>/",
      require("telescope.builtin").current_buffer_fuzzy_find,
      desc = "Find words in buffer",
    },
    { "<Leader>?", require("telescope.builtin").live_grep, desc = "Find words" },
    { "<Leader>`", require("telescope.builtin").find_files, desc = "Find files" },
    {
      "<Leader>~",
      function() require("telescope.builtin").find_files { no_ignore = true } end,
      desc = "Find all files",
    },
  },
  dependencies = {
    {
      "jmacadie/telescope-hierarchy.nvim",
      keys = {
        {
          "<Leader>lc",
          "<CMD>Telescope hierarchy outgoing_calls<CR>",
          desc = "Search outgoing calls",
        },
        {
          "<Leader>lC",
          "<CMD>Telescope hierarchy incoming_calls<CR>",
          desc = "Search incoming calls",
        },
      },
      config = function(plugin, opts)
        require("astronvim.plugins.configs.telescope")(plugin, opts)
        require("telescope").load_extension("hierarchy")
      end,
    },
  },
}
