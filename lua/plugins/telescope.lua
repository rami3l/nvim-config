return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      hidden = true,
      file_ignore_patterns = { ".git/" },
    },
    pickers = {
      diagnostics = { sort_by = "severity" },
      find_files = { hidden = true },
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
  },
}
