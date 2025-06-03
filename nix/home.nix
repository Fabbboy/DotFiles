{ config, pkgs, lib, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "24.05";

  imports = [
    ./modules/zsh.nix
    ./modules/nvim.nix
    ./modules/tmux.nix
    ./modules/env.nix
  ];

  home.packages = with pkgs; [ git nixfmt-classic lazygit direnv nix-direnv ];

  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = { EDITOR = "nvim"; };

  programs.home-manager.enable = true;
}
