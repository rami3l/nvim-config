-- https://writewithharper.com/docs/integrations/neovim#Optional-Configuration
---@diagnostic disable: missing-fields
return {
  settings = {
    ["harper-ls"] = {
      linters = {
        LinkingVerbs = true,
        LongSentences = false,
        SentenceCapitalization = false,
        SpellCheck = false,
        SpelledNumbers = false,
        ToDoHyphen = false,
      },
    },
  },
}
