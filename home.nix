{ config, pkgs, ... }:
let
  myAliases = {
      ll = "ls -l";
      .. = "cd ..";
    };
in
{
  # ... all your other stuff

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };
}