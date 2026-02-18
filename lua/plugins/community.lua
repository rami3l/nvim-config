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
    specs = {
      { "vhyrro/luarocks.nvim", enabled = false },
    },
    opts = { skipInsignificantPunctuation = false },
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

  -- astrocommunity.utility.live-preview
  {
    "brianhuster/live-preview.nvim",
    specs = {
      {
        "AstroNvim/astrocore",
        optional = true,
        opts = function(_, opts)
          -- Disable the default mappings from the pack.
          local n = opts.mappings.n
          local prefix = "<Leader>P"
          n[prefix], n[prefix .. "s"], n[prefix .. "c"], n[prefix .. "p"] =
            false, false, false, false
        end,
      },
    },
    keys = {
      {
        "<Leader>lp",
        function()
          -- HACK: Double `<Cr>` is used to dismiss the `print()` notification.
          -- Maybe the use of proper notification API in the plugin would be better.
          return require("livepreview").is_running() and "<Cmd>LivePreview close<Cr><Cr>"
            or "<Cmd>LivePreview start<Cr><Cr>"
        end,
        expr = true,
        ft = { "markdown", "markdown.mdx", "html", "asciidoc", "svg" },
        desc = "Toggle Preview",
      },
    },
  },
}
