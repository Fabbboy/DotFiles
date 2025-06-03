{ ... }: {
  isWSL = builtins.getEnv "IS_WSL" == "1";
}
