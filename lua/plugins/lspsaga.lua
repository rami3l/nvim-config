---@type LazySpec
return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    {
      "AstroNvim/astrolsp",
      opts = function(_, opts)
        local m = opts.mappings

        -- code action
        for _, key in ipairs { "<Leader>la", "ga" } do
          m.n[key] = {
            "<Cmd>Lspsaga code_action<CR>",
            desc = "LSP code action",
            cond = "textDocument/codeAction",
          }
          m.v[key] = {
            ":<C-U>Lspsaga code_action<CR>",
            desc = "LSP code action",
            cond = "textDocument/codeAction",
          }
        end

        -- rename
        local rename = {
          "<Cmd>Lspsaga rename<CR>",
          desc = "Rename current symbol",
          cond = "textDocument/rename",
        }
        for _, key in ipairs { "<Leader>lr", "<F2>" } do
          m.n[key], m.i[key], m.v[key] = rename, rename, rename
        end
      end,
    },
  },
  opts = {
    callhierarchy = { keys = { edit = "<Enter>" } },
    outline = { keys = { toggle_or_jump = "<Enter>", jump = "g" } },
    rename = { keys = { quit = "<Esc>" } },
  },
}
