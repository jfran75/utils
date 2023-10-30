
Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

THROWAWAY_REGISTER = 'o'
THROWAWAY_MARK = 'I'

require("shinshi.core")
require("shinshi.lazy")

if vim.g.vscode then
  require("shinshi.vscode.init")
end