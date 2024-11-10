-- https://github.com/elijah-potter/harper/blob/master/harper-ls/README.md#configuration
---@type lspconfig.options.harper_ls
---@diagnostic disable: missing-fields
return {
  settings = {
    ["harper-ls"] = {
      linters = {
        linking_verbs = true,
        sentence_capitalization = false,
        spell_check = false,
        spelled_numbers = true,
      },
    },
  },
}
