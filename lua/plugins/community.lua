---@type LazySpec
return {
  -- Add community imports to the `lua/community.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs

  -- astrocommunity.code-runner.conjure
  {
    "Olical/conjure",
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, { name = "conjure" })
          return cmp.setup(config)
        end,
      },
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              ["conjure#log#wrap"] = true,
            },
          },
        },
      },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings
          m.n["<LocalLeader>c"] = { desc = "Conjure connect" }
          m.n["<LocalLeader>e"] = { desc = "Conjure eval" }
          m.n["<LocalLeader>g"] = { desc = "Conjure goto" }
          m.n["<LocalLeader>l"] = { desc = "Conjure log" }
          m.n["<LocalLeader>r"] = { desc = "Conjure reset" }
          m.n["<LocalLeader>s"] = { desc = "Conjure session" }
          m.n["<LocalLeader>t"] = { desc = "Conjure test" }
          m.n["<LocalLeader>v"] = { desc = "Conjure view" }
          m.n["<LocalLeader>x"] = { desc = "Conjure expand" }
        end,
      },
    },
  },

  -- astrocommunity.completion.copilot-cmp
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
        hgcommit = true,
      },
    },
  },

  -- astrocommunity.diagnostics.trouble-nvim
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xr", "<CMD>Trouble lsp toggle<CR>", desc = "Trouble LSP References" },
      { "<leader>xs", "<CMD>Trouble symbols toggle<CR>", desc = "Trouble LSP Symbols" },
    },
  },

  -- astrocommunity.editing-support.nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { max_lines = 2 },
  },

  -- astrocommunity.editing-support.todo-comments-nvim
  {
    "folke/todo-comments.nvim",
    keys = {
      { "g?", require("telescope").extensions["todo-comments"].todo, desc = "Search todos" },
      { "<Leader>fT", require("telescope").extensions["todo-comments"].todo, desc = "Find todos" },
    },
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
    config = function()
      require("peek").setup { app = "browser" }
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  -- astrocommunity.motion.nvim-spider
  {
    "chrisgrieser/nvim-spider",
    dependencies = {
      -- Fixer la détection des mots non-ASCII.
      -- https://github.com/chrisgrieser/nvim-spider?tab=readme-ov-file#utf-8-support
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        opts = function(_, opts)
          opts.rocks = require("astrocore").list_insert_unique(opts.rocks, { "luautf8" })
        end,
      },
    },
    opts = {
      skipInsignificantPunctuation = false,
    },
  },

  -- astrocommunity.motion.leap-nvim
  {
    "ggandor/leap.nvim",
    dependencies = {
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

  -- astrocommunity.pack.clojure
  {
    "Olical/conjure",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              ["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true,
              ["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true,
              ["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "lein repl",
            },
          },
        },
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "joker",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        clojure = { "joker", stop_after_first = true, lsp_format = "fallback" },
        clojurescript = { "joker", stop_after_first = true, lsp_format = "fallback" },
      },
    },
  },

  -- astrocommunity.pack.elixir*
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      if not opts.sources then opts.sources = {} end
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.credo,
      })
      return opts
    end,
  },

  -- astrocommunity.pack.go
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "golangci-lint",
      })
    end,
  },

  -- astrocommunity.pack.python*
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      name = { "venv", ".venv" },
    },
    keys = {
      { "<Leader>lv", "<CMD>VenvSelect<CR>", desc = "Select Venv", ft = "python" },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts) opts.mappings.n["<Leader>lv"] = false end,
      },
    },
  },

  -- astrocommunity.pack.rust
  {
    "mrcjkb/rustaceanvim",
    ---@module "rustaceanvim"
    ---@type rustaceanvim.Opts
    opts = {
      server = { load_vscode_settings = true },
    },
  },
  {
    "Olical/conjure",
    ft = function(_, ft) return require("../utils").list_remove_all(ft, { "rust" }) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "rust_analyzer" })
    end,
  },

  -- astrocommunity.pack.typescript*
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
        typescript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "js" })
    end,
  },
  -- HACK: Works around https://github.com/vuki656/package-info.nvim/issues/164.
  {
    "vuki656/package-info.nvim",
    enabled = false,
  },

  -- astrocommunity.pack.typst
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typst = { "typstyle", lsp_format = "prefer" },
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    opts = {
      dependencies_bin = {
        websocat = "websocat",
      },
    },
  },

  -- astrocommunity.pack.vue
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        vue = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
      },
    },
  },

  -- astrocommunity.pack.zig
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "zls" })
    end,
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
