{ pkgs, config, ... }:

let env = import ./env.nix { inherit (pkgs) lib; };
in {
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
      denv = ''echo "use flake" > "$(pwd)/.envrc" && direnv allow'';
    } // (if env.isWSL then {
      wl-copy = "powershell.exe -Command 'Get-Clipboard | Set-Clipboard -AsPlainText'";
    } else
      { });
  };
}

