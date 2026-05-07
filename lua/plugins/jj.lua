---@type LazySpec
return {
  { "avm99963/vim-jjdescription", lazy = false },
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if vim.fn.executable("jjui") == 1 then
        opts.mappings.n["<Leader>gm"] = {
          function() require("astrocore").toggle_term_cmd { cmd = "jjui", direction = "tab" } end,
          desc = "JJUI dispatch",
        }
      end
    end,
  },
}
