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
          local function curr_file() return vim.fs.basename(vim.api.nvim_buf_get_name(0)) end
          local fts = {
            yaml = true,
            markdown = true,
            -- Disable for `.env` files.
            sh = function() return not string.match(vim.fs.basename(curr_file()), "^%.env.*") end,
            -- HACK: Disable for kitty config files to prevent Copilot LSP errors.
            conf = function() return vim.fs.dirname(curr_file()):match("kitty$") end,
            -- Mark "force" for fts where we want to force enable Copilot even when the buffer is not listed.
            -- This is useful for e.g. neogit commit message buffers.
            gitcommit = "force",
          }
          local force_fts = {}
          for ft, v in pairs(fts) do
            if v == "force" then
              table.insert(force_fts, ft)
              fts[ft] = true
            end
          end
          return vim.tbl_deep_extend("force", opts or {}, {
            should_attach = function()
              return vim.list_contains(force_fts, vim.bo.filetype)
                or (vim.bo.buflisted and vim.bo.buftype == "")
            end,
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = fts,
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

  -- Enable Copilot NES
  -- {
  --   "zbirenbaum/copilot.lua",
  --   dependencies = {
  --     {
  --       "WhoIsSethDaniel/mason-tool-installer.nvim",
  --       opts = function(_, opts)
  --         opts.ensure_installed = require("astrocore").list_insert_unique(
  --           opts.ensure_installed,
  --           { "copilot-language-server" }
  --         )
  --       end,
  --     },
  --     {
  --       "copilotlsp-nvim/copilot-lsp",
  --       init = function() vim.lsp.enable("copilot_ls") end,
  --     },
  --   },
  --   opts = {
  --     nes = {
  --       enabled = true,
  --       keymap = {
  --         accept_and_goto = "<Tab>",
  --         accept = false,
  --         dismiss = "<Esc>",
  --       },
  --     },
  --   },
  -- },
}
