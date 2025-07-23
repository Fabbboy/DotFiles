require "nvchad.options"

local o = vim.o
o.number = true
o.relativenumber = true

vim.filetype.add {
  extension = {
    sbl = "sable",
    sable = "sable",
  },
  filename = {
    ["Sablefile"] = "sable",
  }
}
