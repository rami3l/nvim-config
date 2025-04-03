---@type LazySpec
return {
  -- Add community imports to the `lua/community.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs

  -- astrocommunity.completion.copilot*
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        opts = function()
          local force_enabled_fts = { "gitcommit", "hgcommit" }
          local filetypes = { yaml = true, markdown = true }
          for _, ft in ipairs(force_enabled_fts) do
            filetypes[ft] = true
          end
          return {
            should_attach = function()
              return vim.list_contains(force_enabled_fts, vim.bo.filetype)
                or (vim.bo.buflisted and vim.bo.buftype == "")
            end,
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = filetypes,
          }
        end,
      },
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = function(_, opts)
      opts.sources.default =
        require("astrocore").list_insert_unique(opts.sources.default, { "copilot" })
      opts.sources.providers.copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
      }
    end,
  },

  -- astrocommunity.diagnostics.trouble-nvim
  {
    "folke/trouble.nvim",
    keys = {
      { "<Leader>xr", "<CMD>Trouble lsp toggle<CR>", desc = "Trouble LSP References" },
      { "<Leader>xs", "<CMD>Trouble symbols toggle<CR>", desc = "Trouble LSP Symbols" },
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
      { "<Leader>lp", "<CMD>PeekToggle<CR>", desc = "Toggle Preview", ft = "markdown" },
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

  -- astrocommunity.motion.nvim-spider
  {
    "chrisgrieser/nvim-spider",
    dependencies = {
      -- Fixer la détection des mots non-ASCII.
      -- https://github.com/chrisgrieser/nvim-spider?tab=readme-ov-file#utf-8-support
      { "rami3l/nvim-spider-utf8", build = "rockspec" },
    },
    opts = {
      skipInsignificantPunctuation = false,
    },
  },

  -- astrocommunity.motion.leap-nvim
  {
    "ggandor/leap.nvim",
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings
          local forward = { "<Plug>(leap-forward)", desc = "Leap forward" }
          local backward = { "<Plug>(leap-backward)", desc = "Leap backward" }
          local from_window = { "<Plug>(leap-from-window)", desc = "Leap from window" }

          m.n.s, m.x.x, m.o.x = forward, forward, forward
          m.n.S, m.x.X, m.o.X = backward, backward, backward
          m.n.gs, m.x.gs, m.o.gs = from_window, from_window, from_window

          -- The following default keybindings conflict with `nvim-surround`,
          -- so they have to be disabled:
          m.x.s, m.o.s = false, false
          m.x.S, m.o.S = false, false
        end,
      },
    },
  },

  -- astrocommunity.test.neotest
  {
    "nvim-neotest/neotest",
    keys = {
      {
        "<Leader>Te",
        function() require("neotest").summary.toggle() end,
        desc = "Toggle summary",
      },
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
