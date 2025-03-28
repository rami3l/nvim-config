---@type LazySpec
return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      name = { "venv", ".venv" },
    },
    keys = {
      { "<Leader>lv", "<CMD>VenvSelect<CR>", desc = "Select Venv", ft = "python" },
    },
    dependencies = {
      { "nvim-telescope/telescope.nvim", enabled = false },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts) opts.mappings.n["<Leader>lv"] = false end,
      },
    },
  },

  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = {
      config = {
        basedpyright = {
          settings = {
            -- https://github.com/DetachHead/basedpyright/blob/main/docs/configuration/language-server-settings.md
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                completeFunctionParens = true,
                diagnosticMode = "workspace",
                strictSetInference = true,
                stubPath = "./typings",
                typeCheckingMode = "strict",
                useLibraryCodeForTypes = true,

                inlayHints = {
                  functionReturnTypes = true,
                  pytestParameters = true,
                  variableTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
