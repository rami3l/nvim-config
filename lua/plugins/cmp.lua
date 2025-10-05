---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    opts = {
      cmdline = {
        keymap = {
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
        },
      },
    },
  },

  -- Integrate Copilot with `blink.cmp`
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        opts = function(_, opts)
          local function curr_file() return vim.api.nvim_buf_get_name(0) end
          local fts = {
            copilot = {
              yaml = true,
              markdown = true,
              -- Disable for `.env` files.
              sh = function() return not string.match(vim.fs.basename(curr_file()), "^%.env.*") end,
              -- HACK: Disable for kitty config files to prevent Copilot LSP errors.
              conf = function() return vim.fs.dirname(curr_file()):match("kitty$") end,
            },

            -- List of fts where we want to force enable Copilot even when the buffer
            -- is not listed. This is useful for e.g. neogit commit message buffers.
            copilot_force = {
              "gitcommit",
            },
          }
          for _, v in ipairs(fts.copilot_force) do
            fts.copilot[v] = true
          end

          return vim.tbl_deep_extend("force", opts or {}, {
            should_attach = function()
              return vim.list_contains(fts.copilot_force, vim.bo.filetype)
                or (vim.bo.buflisted and vim.bo.buftype == "")
            end,
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = fts.copilot,
          })
        end,
      },
      { "giuxtaposition/blink-cmp-copilot", lazy = true },
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

  -- Copilot NES
  {
    "folke/sidekick.nvim",
    event = "User AstroFile",
    opts = {
      cli = { mux = { backend = "zellij", enabled = true } },
    },
    keys = {
      {
        "<Tab>",
        -- Try to execute the first of the following that applies:
        -- * Jump to the next NES location.
        -- * Apply the current NES.
        -- * Fall back on regular `<Tab>`.
        function() return require("sidekick").nes_jump_or_apply() and nil or "<Tab>" end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
    },
  },
}
