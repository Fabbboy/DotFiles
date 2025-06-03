{ config, lib, ... }:

let settings = { isWSL = false; };

in { config._module.args.settings = settings; }
