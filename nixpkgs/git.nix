{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Lucas-Kohorst";
    userEmail = "kohorstlucas@gmail.com";

    # ignore home and vim swap files.
    ignores = [ "*~" "*.swp" ];
    
    extraConfig = {
        init.defaultBranch = "main";
      };
  };
}