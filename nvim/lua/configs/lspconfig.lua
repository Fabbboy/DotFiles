require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "gopls", "ts_ls", "zls" }
vim.lsp.enable(servers)

local group_id = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })
local map = vim.keymap.set
local lsp = vim.lsp

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { '.clangd', 'compile_commands.json', 'Makefile', 'CMakeLists.txt'},
  settings = {
  },
})

vim.lsp.config('zls', {
  cmd = { 'zls' },
  filetypes = {'zig', 'zon'},
  root_markers = {'build.zig', '.zig-cache', 'zig-out'},
  settings = {}
}) 

vim.api.nvim_create_autocmd("LspAttach", {
  group = group_id,
  callback = function(ev)
    local bufnr = ev.buf

    local opts = { buffer = bufnr, remap = false }
    map("n", "gd", lsp.buf.definition, opts)
    map("n", "K", lsp.buf.hover, opts)
    map("n", "<leader>f", function() lsp.buf.format({ async = true }) end, opts)
    map("n", "<leader>ca", lsp.buf.code_action, opts)
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers
--
--
--
--
--
