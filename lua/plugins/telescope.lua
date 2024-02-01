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
}
