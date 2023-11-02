-- return {}
return {
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      --  print("Loaded nightfly theme")
      -- vim.cmd([[colorscheme nightfly]])
      Cmd("colorscheme nightfly")
    end,
  },
}