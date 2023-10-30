local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode == nil then
  require("lazy").setup({ { import = "shinshi.plugins" }, { import = "shinshi.plugins.lsp" } }, {
    install = {
      colorscheme = { "nightfly" },
    },
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  })
else
  require("lazy").setup(
    {
      { import = "shinshi.vscode.plugins" }
    },
    {
      install = {
        -- colorscheme = { "gruvbox-material" },
        colorscheme = { "nightfly" },
      },
      checker = {
        enabled = true,
        notify = false,
      },
      change_detection = {
        notify = false,
      },
    }
  )
  -- Cmd("colorscheme gruvbox-material")
end