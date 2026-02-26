---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
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
    ---@module "blink.cmp"
    ---@param opts blink.cmp.Config
    opts = function(_, opts)
      do
        local default_sources = opts.sources.default
        if type(default_sources) == "function" then default_sources = default_sources() end
        opts.sources.default =
          require("astrocore").list_insert_unique(default_sources, { "copilot" })
      end
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
    ---@module "sidekick"
    ---@class sidekick.Config
    opts = {
      nes = { enabled = false },
      cli = { mux = { backend = "zellij", enabled = true } },
    },
  },
}
