{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; 
      plugins = [ "git" "z" "history" ];
    };

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      gc = "nix-collect-garbage -d";
      hms = "home-manager --flake ~/DotFiles#nixos switch";
    };
  };
}

