-- Based on <https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/plugins/heirline.lua>.
-- See <https://docs.astronvim.com/recipes/status/#default-heirline-configuration> for the defaults,
-- and <https://github.com/AstroNvim/astroui/blob/main/doc/api.md> for the AstroUI APIs.
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")
    opts.statusline[3] = status.component.file_info { filetype = {}, filename = false }

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

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
      },
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
      status.component.nav { percentage = false },
    }
    return opts
  end,
}
