require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", {})
map("i", "jk", "<ESC>", opts)
map("n", "<A-Up>", "<Cmd>m .-2<CR>==", opts)
map("n", "<A-Down>", "<Cmd>m .+1<CR>==", opts)

map('n', "<leader>ff", ":GFiles<CR>", opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
