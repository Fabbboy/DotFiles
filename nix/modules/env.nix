{ lib }:

{
  isWSL = lib.hasInfix "microsoft" (lib.toLower (builtins.readFile "/proc/version"));
}
