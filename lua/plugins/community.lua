---@type LazySpec
return {
  -- Add community imports to the `lua/community.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs

  -- astrocommunity.diagnostics.trouble-nvim
  {
    "folke/trouble.nvim",
    keys = {
      { "<Leader>xr", "<Cmd>Trouble lsp toggle<Cr>", desc = "Trouble LSP References" },
      { "<Leader>xs", "<Cmd>Trouble symbols toggle<Cr>", desc = "Trouble LSP Symbols" },
    },
  },

  -- astrocommunity.editing-support.nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { max_lines = 2 },
  },

  -- astrocommunity.git.git-blame-nvim
  {
    "f-person/git-blame.nvim",
    opts = {
      date_format = "%r",
      message_template = "  <author> · <date> · <sha>",
      message_when_not_committed = "",
      gitblame_schedule_event = "CursorHold",
      gitblame_clear_event = "CursorHoldI",
    },
  },

  -- astrocommunity.markdown-and-latex.peek-nvim
  {
    "toppair/peek.nvim",
    keys = {
      { "<Leader>lp", "<Cmd>PeekToggle<Cr>", desc = "Toggle Preview", ft = "markdown" },
    },
    config = function()
      local peek = require("peek")
      local function peek_toggle() (peek.is_open() and peek.close or peek.open)() end
      peek.setup { app = "browser" }
      vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
      vim.api.nvim_create_user_command("PeekClose", peek.close, {})
      vim.api.nvim_create_user_command("PeekToggle", peek_toggle, {})
    end,
  },

  -- astrocommunity.motion.flash-nvim
  {
    "folke/flash.nvim",
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings

          local jump = { function() require("flash").jump() end, desc = "Flash" }
          local treesitter = {
            function() require("flash").treesitter() end,
            desc = "Flash Treesitter",
          }
          local from_window = {
            function() require("flash").jump { search = { multi_window = true } } end,
            desc = "Flash from window",
          }

          m.n.s, m.x.x, m.o.x = jump, jump, jump
          m.n.S, m.x.X, m.o.X = treesitter, treesitter, treesitter
          m.n.gs, m.x.gs, m.o.gs = from_window, from_window, from_window

          -- The following default keybindings conflict with `nvim-surround`,
          -- so they have to be disabled:
          m.x.s, m.o.s = false, false
          m.x.S, m.o.S = false, false
        end,
      },
    },
  },

  -- astrocommunity.motion.nvim-spider
  {
    "chrisgrieser/nvim-spider",
    dependencies = {
      -- FIXME: `b` is no longer working with newer versions of `luautf8`. Disabling UTF-8 support for now.
      -- Fixer la détection des mots non-ASCII.
      -- https://github.com/chrisgrieser/nvim-spider?tab=readme-ov-file#utf-8-support
      -- { "rami3l/nvim-spider-utf8", build = "rockspec" },
    },
    opts = {
      skipInsignificantPunctuation = false,
    },
  },

  -- astrocommunity.test.neotest
  {
    "nvim-neotest/neotest",
    keys = {
      {
        "<Leader>To",
        function() require("neotest").output.open { enter = true } end,
        desc = "Show output",
      },
      { "<Leader>Tn", function() require("neotest").run.run() end, desc = "Run nearest" },
      {
        "<Leader>T%",
        function() require("neotest").run.run(vim.fn.expand("%")) end,
        desc = "Run current file",
      },
      {
        "<Leader>Td",
        function() require("neotest").run.run { suite = false, strategy = "dap" } end,
        desc = "Debug nearest",
      },
    },
  },
}
