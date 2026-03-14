---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = {
    handlers = {
      csharp_ls = function(server)
        -- TODO: Remove this hack when the fix for AstroNvim v6 is upstreamed
        vim.lsp.enable(server)
        require("csharpls_extended").buf_read_cmd_bind()
      end,
    },
  },
}
