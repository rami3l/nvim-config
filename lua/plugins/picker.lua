---@type LazySpec
return {
  -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {},
    keys = {
      { "gL", function() require("snacks.picker").diagnostics() end, desc = "Search diagnostics" },
      ---@diagnostic disable-next-line: undefined-field
      { "g?", function() require("snacks.picker").todo_comments() end, desc = "Search todos" },
      {
        "<Leader>lc",
        function() require("snacks.picker").lsp_outgoing_calls() end,
        desc = "Find outgoing calls",
      },
      {
        "<Leader>lC",
        function() require("snacks.picker").lsp_incoming_calls() end,
        desc = "Find incoming calls",
      },

      -- GitHub issues and PRs
      {
        "<leader>gi",
        function() require("snacks.picker").gh_issue() end,
        desc = "GitHub Issues (open)",
      },
      {
        "<leader>gI",
        function() require("snacks.picker").gh_issue { state = "all" } end,
        desc = "GitHub Issues (all)",
      },
      {
        "<leader>gp",
        function() require("snacks.picker").gh_pr() end,
        desc = "GitHub Pull Requests (open)",
      },
      {
        "<leader>gP",
        function() require("snacks.picker").gh_pr { state = "all" } end,
        desc = "GitHub Pull Requests (all)",
      },
    },
  },
  {
    "dmtrKovalenko/fff.nvim",
    build = function() require("fff.download").download_or_build_binary() end,
    lazy = false,
    opts = {
      keymaps = {
        move_up = { "<Up>", "<C-p>", "<C-k>" },
        move_down = { "<Down>", "<C-n>", "<C-j>" },
      },
    },
    keys = {
      {
        "<Leader>/",
        function()
          require("fff").live_grep {
            grep = { modes = { "fuzzy", "regex", "plain" } },
            query = vim.api.nvim_buf_get_name(0) .. " ",
          }
        end,
        desc = "Find words in buffer",
      },
      {
        "<Leader>?",
        function() require("fff").live_grep { grep = { modes = { "fuzzy", "regex", "plain" } } } end,
        desc = "Find words",
      },
      {
        "<Leader>`",
        function() require("snacks.picker").files { hidden = true } end,
        desc = "Find files",
      },
      {
        "<Leader>~",
        function() require("snacks.picker").files { hidden = true, ignored = true } end,
        desc = "Find all files",
      },
    },
  },
}
