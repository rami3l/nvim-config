-- https://github.com/ray-x/go.nvim#nvim-lsp-setup
return {
  settings = {
    gofumpt = true,
    gopls = {
      hints = {
        rangeVariableTypes = true,
        parameterNames = true,
        constantValues = true,
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        functionTypeParameters = true,
      },
    },
  },
}
