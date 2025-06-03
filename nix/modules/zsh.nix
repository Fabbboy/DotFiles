{ config, pkgs, lib, settings, ... }:
let isWSL = settings.isWSL or false;
in {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "history" ];
    };

    initContent = ''
      echo ${if isWSL then "Running on WSL" else "Not running on WSL"}
    '';

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      gc = "nix-collect-garbage -d";
      hms = "home-manager --flake ~/DotFiles#nixos switch";
      denv = ''echo "use flake" > "$(pwd)/.envrc" && direnv allow'';
    } // (if isWSL then {
      shcopy = "clip.exe";
      shpaste = "powershell.exe -Command 'Get-Clipboard'";
    } else
      { });
  };
}
