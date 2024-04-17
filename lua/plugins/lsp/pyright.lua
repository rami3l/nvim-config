-- https://github.com/microsoft/pyright/blob/main/docs/settings.md
-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
---@type lspconfig.options.pyright
---@diagnostic disable: missing-fields
return {
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        completeFunctionParens = true,
        diagnosticMode = "workspace",
        strictSetInference = true,
        typeCheckingMode = "strict",
        useLibraryCodeForTypes = true,

        inlayHints = {
          callArgumentNames = "partial",
          functionReturnTypes = true,
          pytestParameters = true,
          variableTypes = true,
        },
      },
    },
  },
}
