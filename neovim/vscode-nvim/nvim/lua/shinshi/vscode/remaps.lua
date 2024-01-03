Map("", "<C-d>", "13+")
Map("", "<C-u>", "13-")
Map("", "<C-f>", "10+")
Map("", "<C-b>", "10-")
-- Map("", '"', ":")
-- Map("", "'", '"')
-- Map("", ":", ",")
-- Map("", ",s", "/\\V")
-- Map("", ",S", "?\\V")
-- Map("", "/", "/\\v")
-- Map("", "?", "?\\v")
-- Map("", "zp", "]p")
-- Map("", "zP", "]P")

-- Map({"n", "v"}, '`', '@')
-- Map({"n", "v"}, '``', '@@')

-- Map("v", "u", "<Esc>u")
-- Map("v", "&", ":s`\\V")

Map("i", "<C-l>", "<C-x><C-l>")
Map("i", "<C-k>", "<C-o>O")
Map("i", "<C-j>", "<C-o>o")

Map("o", "{", "V{")
Map("o", "}", "V}")
Map("o", "+", "v+")
Map("o", "-", "v-")

-- Map("n", "<C-k>", "O<Esc>")
-- Map("n", "<C-j>", "o<Esc>")
-- Map("n", "R", "q")
-- Map("n", "gK", "K")
-- Map("n", "Y", "yg_")
-- Map("n", "~", "~h")
-- Map("n", "dp", "ddp")
-- Map("n", "dP", "ddkP")
-- Map("n", "yp", "yyp")
-- Map("n", "yP", "yyP")
-- Map("n", "&", ":%s`\\V")

print("remaps.lua loaded")

Map("n", "k", "gk") -- Join current line with the next line with no space in between, *also* discarding any leading whitespace of the next line. Because gJ would include indentation. Stupidly.
Map("n", "j", "gj") -- Join current line with the next line with no space in between, *also* discarding any leading whitespace of the next line. Because gJ would include indentation. Stupidly.

