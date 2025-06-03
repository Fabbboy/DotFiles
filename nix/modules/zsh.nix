{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "history" ];
    };

    initContent = ''
      if grep -qi microsoft /proc/version; then
        export IS_WSL=1
      else
        export IS_WSL=0
      fi
    '';

    shellAliases = let env = import ../env.nix { inherit pkgs; };
    in {
      ll = "ls -lah";
      gs = "git status";
      gc = "nix-collect-garbage -d";
      hms = "home-manager --flake ~/DotFiles#nixos switch";
      denv = ''echo "use flake" > "$(pwd)/.envrc" && direnv allow'';
    } // (if env.isWSL then {
      wsl = "wsl.exe";
      wsl2 = "wsl.exe --distribution Ubuntu-22.04";
    } else
      {

      });
  };
}
