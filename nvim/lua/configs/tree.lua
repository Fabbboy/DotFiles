local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.sable = {
  install_info = {
    url = "https://github.com/Fabbboy/sable.git",
    files = {"src/parser.c"},
    branch = "master",
    location = "tree-sitter-sable",
    generate_requires_npm = true
  },
  filetype = {"sbl", "sable"}
}

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "vim", "lua", "vimdoc",
    "html", "css", "c", "cpp" 
  },
  highlight = {
    enable = true,
  },
}

