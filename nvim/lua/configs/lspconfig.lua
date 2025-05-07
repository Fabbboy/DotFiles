require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

local group_id = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })
local map = vim.keymap.set
local lsp = vim.lsp

vim.api.nvim_create_autocmd("LspAttach", {
  group = group_id,
  callback = function(ev)
    local bufnr = ev.buf

    local opts = { buffer = bufnr, remap = false}
    map("n", "gd", lsp.buf.definition, opts)
    map("n", "K", lsp.buf.hover, opts)
    map("n", "<leader>f", function() lsp.buf.format({async = true}) end, opts)
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
