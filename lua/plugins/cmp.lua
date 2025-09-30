local fts
do
  local function curr_file() return vim.api.nvim_buf_get_name(0) end
  fts = {
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
end

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

  -- Enable Copilot NES
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(
            opts.ensure_installed,
            { "copilot-language-server" }
          )
        end,
      },
      {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        ---@diagnostic disable: missing-fields
        opts = {
          config = {
            copilot_ls = {
              get_language_id = function(_, ft)
                return require("copilot.client.filetypes").language_for_file_type(ft)
              end,
              root_dir = function(bufnr, on_dir)
                local ft = vim.bo[bufnr].filetype
                if require("copilot.client.filetypes").is_ft_disabled(ft, fts.copilot) then
                  return
                end
                on_dir(vim.uv.cwd())
              end,
            },
          },
        },
      },
      {
        "copilotlsp-nvim/copilot-lsp",
        init = function() vim.lsp.enable("copilot_ls") end,
        opts = { nes = { move_count_threshold = 1 } },
      },
    },
    opts = {
      nes = {
        enabled = true,
        keymap = {
          accept_and_goto = "<Tab>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    },
  },
}
