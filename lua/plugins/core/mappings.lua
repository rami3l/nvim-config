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

---@type AstroCoreMappings
return {
  -- The first key is the mode, the second key is the lefthand side of the map.
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

    ["<Leader>W"] = { "<CMD>noautocmd w<CR>", desc = "Save w/o autocmds" },

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

    ["<Leader><Tab>"] = { desc = "󰌒 " .. "Tabs" },
    ["<Leader><Tab><Tab>"] = { "<CMD>tabnew<CR>", desc = "New tab" },
    ["<Leader><Tab>["] = { "<CMD>tabprevious<CR>", desc = "Previous tab" },
    ["<Leader><Tab>]"] = { "<CMD>tabnext<CR>", desc = "Next tab" },
    ["<Leader><Tab>c"] = { "<CMD>tabclose<CR>", desc = "Close tab" },
    ["<Leader><Tab>f"] = { "<CMD>tabfirst<CR>", desc = "First tab" },
    ["<Leader><Tab>l"] = { "<CMD>tablast<CR>", desc = "Last tab" },
    ["<Leader><Tab>o"] = { "<CMD>tabonly<CR>", desc = "Close other tabs" },
  },

  v = {
    ["<Leader>sz"] = { [[:sort i<CR>]], desc = "Sort lines" },
    ["<Leader>sZ"] = { [[:sort! i<CR>]], desc = "Sort lines (rev)" },
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
    -- ["<esc>"] = false,
  },
}
