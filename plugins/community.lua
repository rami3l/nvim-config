return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },

  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  {
    "toppair/peek.nvim",
    config = function()
      require("peek").setup { app = "browser" }
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  { import = "astrocommunity.motion.leap-nvim" },

  { import = "astrocommunity.motion.nvim-spider" },
  {
    "chrisgrieser/nvim-spider",
    opts = {
      skipInsignificantPunctuation = false,
    },
  },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.pack.python" },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      name = { "venv", ".venv" },
    },
  },

  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.project.nvim-spectre" },

  { import = "astrocommunity.test.neotest" },
  {
    "nvim-neotest/neotest",
    keys = {
      -- https://github.com/AstroNvim/astrocommunity/blob/8157924d02308c24754fb4f71e165700f989043f/lua/astrocommunity/project/nvim-spectre/init.lua#L14-L23
      {
        "<leader>Ts",
        function() require("neotest").summary.toggle() end,
        desc = "Toggle summary",
      },
      {
        "<leader>To",
        function() require("neotest").output.open { enter = true } end,
        desc = "Show output",
      },
      { "<leader>Tn", function() require("neotest").run.run() end, desc = "Run nearest" },
      {
        "<leader>T%",
        function() require("neotest").run.run(vim.fn.expand("%")) end,
        desc = "Run current file",
      },
      {
        "<leader>Td",
        function() require("neotest").run.run { suite = false, strategy = "dap" } end,
        desc = "Debug nearest",
      },
    },
    opts = function(_, opts)
      opts.adapters["neotest-rust"] = require("neotest-rust") { args = { "--all-features" } }
    end,
  },
}
