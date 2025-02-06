local M = {}

--- Remove all occurrences of one or more values in the list-like table `dst` (THIS MODIFIES `dst`)
---@param dst any[]|nil The list like table that you want to remove from
---@param src any[] Values to be removed
---@return any[] # The modified list-like table
function M.list_remove_all(dst, src)
  if not dst then dst = {} end
  local toremove = {}
  for _, val in ipairs(src) do
    toremove[val] = true
  end
  for key, val in ipairs(dst) do
    if toremove[val] then table.remove(dst, key) end
  end
  return dst
end

function M.config_path()
  -- https://lazy.folke.io/developers#building
  return vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
end

return M
