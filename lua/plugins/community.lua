---@type LazySpec
return {
  -- Add community imports to the `lua/config/lazy.lua` file in your Neovim configuration folder (typically ~/.config/nvim)
  -- this guarantees that the community plugin specs are loaded before the user configuration

  -- This is a good place to do further customize the options set by the community plugins/packs

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
      message_template = "  <author> • <date> • <sha>",
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

  -- astrocommunity.pack.java
  {
    "jay-babu/mason-null-ls.nvim",

    opts = function(_, opts)
      local nls = require("null-ls")

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
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "typstfmt",
      })
    end,
  },

  -- astrocommunity.project.nvim-spectre
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local menu = {
            desc = require("astroui").get_icon("Spectre", 1, true) .. "Search/Replace",
          }
          opts.mappings.n["<Leader>s"] = menu
          opts.mappings.x["<Leader>s"] = menu
        end,
      },
    },
  },

  -- astrocommunity.test.neotest
  {
    "nvim-neotest/neotest",
    keys = {
      -- https://github.com/AstroNvim/astrocommunity/blob/8157924d02308c24754fb4f71e165700f989043f/lua/astrocommunity/project/nvim-spectre/init.lua#L14-L23
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
