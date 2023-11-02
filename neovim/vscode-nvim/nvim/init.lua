
Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

THROWAWAY_REGISTER = 'o'
THROWAWAY_MARK = 'I'

if vim.g.vscode == nil then
  require("shinshi.core")
  require("shinshi.lazy")
else
  require("shinshi.core.options")
  require("shinshi.lazy")
  require("shinshi.vscode.init")
end