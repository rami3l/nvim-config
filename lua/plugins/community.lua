---@type LazySpec
return {
  -- Add community imports to the `lua/config/lazy.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs

  -- "astrocommunity.markdown-and-latex.peek-nvim"
  {
    "toppair/peek.nvim",
    config = function()
      require("peek").setup { app = "browser" }
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  -- astrocommunity.motion.nvim-spider
  {
    "chrisgrieser/nvim-spider",
    opts = {
      skipInsignificantPunctuation = false,
    },

    -- astrocommunity.pack.python
    {
      "linux-cultist/venv-selector.nvim",
      opts = {
        name = { "venv", ".venv" },
      },
    },
  },

  -- astrocommunity.test.neotest
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
