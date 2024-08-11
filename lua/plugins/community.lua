---@type LazySpec
return {
  -- Add community imports to the `lua/community.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs

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
        end,
      },
    },
  },

  -- astrocommunity.pack.elixir
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

  -- astrocommunity.pack.java
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "google-java-format",
      })
      opts.handlers.clang_format = function()
        nls.register {
          nls.builtins.formatting.clang_format.with {
            disabled_filetypes = { "java" },
          },
        }
      end
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
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "rust_analyzer" })
    end,
  },

  -- astrocommunity.pack.swift
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      if not opts.sources then opts.sources = {} end
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.swift_format,
        nls.builtins.formatting.swiftlint,
      })
      return opts
    end,
  },

  -- astrocommunity.pack.typst
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("utils").list_remove_all(opts.ensure_installed, { "typst_lsp" })
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "tinymist" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "typstfmt",
      })
    end,
  },
  {
    "chomosuke/typst-preview.nvim",
    opts = {
      dependencies_bin = {
        -- HACK: Currently `tinymist preview` is not updating the preview properly
        -- due to unknown reasons, so `TypstPreviewUpdate` is required from time to time
        -- to update the plugin-hosted `typst-preview`.
        -- ["typst-preview"] = "tinymist",
        websocat = "websocat",
      },
    },
  },

  -- astrocommunity.search.nvim-spectre
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local m = opts.mappings
          local menu = {
            desc = require("astroui").get_icon("Spectre", 1, true) .. "Search/Replace",
          }
          m.n["<Leader>s"], m.x["<Leader>s"] = menu, menu
          m.n["<Leader>ss"] = { require("spectre").toggle, desc = "Spectre" }
        end,
      },
    },
    opts = function()
      local prefix = "<Leader>s"
      return {
        mapping = {
          -- Override defaults
          select_template = { map = prefix .. "p" },
          delete_line = { map = prefix .. "d" },

          -- Override `astrocommunity` presets
          send_to_qf = { map = prefix .. "q" },
          replace_cmd = { map = prefix .. "c" },
          show_option_menu = { map = prefix .. "o" },
          run_current_replace = { map = prefix .. "C" },
          run_replace = { map = prefix .. "R" },
          change_view_mode = { map = prefix .. "v" },
          resume_last_search = { map = prefix .. "l" },
        },
      }
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
