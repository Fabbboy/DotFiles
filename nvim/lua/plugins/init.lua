return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',     -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end
  },
  {
    "junegunn/fzf.vim",
    lazy = false,
    dependencies = { "junegunn/fzf" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "ziglang/zig.vim"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "c", "cpp"
      },
    },
  }
}
