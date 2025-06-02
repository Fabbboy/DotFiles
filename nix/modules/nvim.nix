{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    unzip
    go
    nodejs
    gcc
    git
  ];

  home.file = {
    ".config/nvim/init.lua".source = ../../nvim/init.lua;
    ".config/nvim/lua".source = ../../nvim/lua;
  };
}