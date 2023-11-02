return {
  {
    "ggandor/leap.nvim",
    config = function()
      print("Loaded leap")
      local leap = require("leap")

      leap.opts.case_sensitive = false

      leap.opts.safe_labels = { "f", ";", "q", "n", "u", "t", "/", "S", "F", "N", "L", "H", "M", "U", "G",
        "T", "?", "Z" }
      leap.opts.labels = { "f", ";", "q", "n", "u", "t", "/", "S", "F", "N", "L", "H", "M", "U", "G", "T",
        "?", "Z" }
    end,
  },
}
