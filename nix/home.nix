{ config, pkgs, ... }:

{

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "24.05"; 
  imports = [
	  ./modules/zsh.nix
    ./modules/nvim.nix
    ./modules/tmux.nix
  ];
 
  home.packages = with pkgs; [
    git
    nixfmt-classic
    lazygit
  ];

  home.file = {
  };

 
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
