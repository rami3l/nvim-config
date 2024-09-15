-- Based on <https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/plugins/heirline.lua>.
-- See <https://docs.astronvim.com/recipes/status/#default-heirline-configuration> for the defaults,
-- and <https://github.com/AstroNvim/astroui/blob/main/doc/api.md> for the AstroUI APIs.

---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")

    -- See <https://neovim.io/doc/user/cmdline.html#%3A%3As> for the modifier syntax.
    local path_func = status.provider.filename { modify = ":.:h", fallback = "" }
    opts.winbar[1][1] = status.component.separated_path { path_func = path_func }
    opts.winbar[2] = {
      status.component.separated_path { path_func = path_func },
      status.component.file_info {
        filename = { modify = ":t:r", fallback = "" },
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        filetype = false,
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      },
      status.component.breadcrumbs {
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      },
    }

    local function toggleterm_status()
      return {
        provider = function() return "ToggleTerm [" .. vim.b.toggle_number .. "]" end,
        condition = function()
          return status.condition.buffer_matches { filetype = { "toggleterm" } }
        end,
      }
    end

    local function nav()
      local res = status.component.nav { percentage = false }
      local children = res[2]
      local scrollbar = children[#children]

      local spinner = { "⠁", "⠉", "⠋", "⠛", "⠟", "⠿", "⡿", "⣿" }
      scrollbar.provider = function()
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #spinner) + 1
        if spinner[i] then return status.utils.stylize(spinner[i], scrollbar.opts) end
      end
      return res
    end

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
      },
      toggleterm_status(),
      status.component.git_branch(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp {
        lsp_client_names = {
          integrations = {
            null_ls = false,
            conform = false,
            ["nvim-lint"] = false,
          },
        },
      },
      status.component.virtual_env(),
      status.component.treesitter(),
      nav(),
    }
    return opts
  end,
}
