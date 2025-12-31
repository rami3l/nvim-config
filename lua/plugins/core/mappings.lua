-- Partially borrowed from <https://github.com/ThePrimeagen/init.lua/blob/97c039bb88d8bbbcc9b1e3d0dc716a2ba202c6d2/lua/theprimeagen/remap.lua>.
-- See <https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/mappings.lua> for the default settings.

-- https://github.com/rebelot/heirline.nvim/blob/af3f441ea10f96105e1af14cd37bf213533812d2/lua/heirline/utils.lua#L127
local function visible_bufs(tabpage)
  tabpage = tabpage or 0
  local buf_set = {}
  local wins = vim.api.nvim_tabpage_list_wins(tabpage)
  for _, winid in ipairs(wins) do
    local bufnr = vim.api.nvim_win_get_buf(winid)
    buf_set[bufnr] = true
  end
  return buf_set
end

local function window_zoom_toggle()
  if vim.fn.exists("t:zoomed") == 1 and vim.t.zoomed == 1 then
    vim.cmd("execute t:zoom_winrestcmd")
    vim.t.zoomed = 0
  else
    vim.t.zoom_winrestcmd = vim.fn.winrestcmd()
    vim.cmd("resize")
    vim.cmd("vertical resize")
    vim.t.zoomed = 1
  end
end

---@type AstroCoreMappings
return {
  -- The first key is the mode, the second key is the left-hand side of the map.
  -- See <https://neovim.io/doc/user/map.html#%3Amap-modes> for all possible modes.

  [""] = {
    ["<F1>"] = "<nop>",

    ["<LocalLeader>c"] = { [["_c]], desc = "Change w/o cut" },
    ["<LocalLeader>d"] = { [["_d]], desc = "Delete w/o cut" },
    ["<LocalLeader>y"] = { [["+y]], desc = "Yank to clipboard" },
  },

  n = {
    Q = "<nop>",
    ["<LocalLeader>C"] = { [["_C]], desc = "Change till NL w/o cut" },
    ["<LocalLeader>D"] = { [["_D]], desc = "Delete till NL w/o cut" },
    ["<LocalLeader>Y"] = { [["+Y]], desc = "Yank line to clipboard" },

    ["<Leader>W"] = { "<Cmd>noautocmd w<Cr>", desc = "Save w/o autocmds" },

    ["<Leader>bc"] = {
      function()
        local buffer = require("astrocore.buffer")
        local visibles = visible_bufs()
        for _, buf in ipairs(vim.t.bufs) do
          if not visibles[buf] then buffer.close(buf) end
        end
      end,
      desc = "Close invisible buffers",
    },

    ["<C-w>z"] = { window_zoom_toggle, desc = "Zoom window" },
    ["<C-w><C-z>"] = { window_zoom_toggle, desc = "Zoom window" },

    ["<Leader><Tab>"] = { desc = "󰌒 " .. "Tabs" },
    ["<Leader><Tab><Tab>"] = { "<Cmd>tabnew<Cr>", desc = "New tab" },
    ["<Leader><Tab>["] = { "<Cmd>tabprevious<Cr>", desc = "Previous tab" },
    ["<Leader><Tab>]"] = { "<Cmd>tabnext<Cr>", desc = "Next tab" },
    ["<Leader><Tab>c"] = { "<Cmd>tabclose<Cr>", desc = "Close tab" },
    ["<Leader><Tab>f"] = { "<Cmd>tabfirst<Cr>", desc = "First tab" },
    ["<Leader><Tab>l"] = { "<Cmd>tablast<Cr>", desc = "Last tab" },
    ["<Leader><Tab>o"] = { "<Cmd>tabonly<Cr>", desc = "Close other tabs" },
  },

  v = {
    ["<Leader>sz"] = { [[:sort i<Cr>]], desc = "Sort lines" },
    ["<Leader>sZ"] = { [[:sort! i<Cr>]], desc = "Sort lines (rev)" },
  },

  x = {
    ["<LocalLeader>p"] = { [["_dP]], desc = "Paste w/o cut" },
    ["<LocalLeader>D"] = { [["_D]], desc = "Delete line w/o cut" },
    ["<LocalLeader>Y"] = { [["+Y]], desc = "Yank line to clipboard" },
  },

  i = {
    ["<F1>"] = "<nop>",

    ["<C-c>"] = "<Esc>",
  },

  c = {
    ["<C-j>"] = "<C-n>",
    ["<C-k>"] = "<C-p>",
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<Esc>"] = false,
  },
}
