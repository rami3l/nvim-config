-- https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/" },
    },
    pickers = {
      diagnostics = { sort_by = "severity" },
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
  },
}
