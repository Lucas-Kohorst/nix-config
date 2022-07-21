{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    sha256 = "1n03v5p8822hmx94sn31w16a11grx8f6dj2rnl8qccgxmssi5alx";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  # home = {
  #  username = "lucas";
  #  homeDirectory = "/home/lucas";
  #  stateVersion = "22.05";
  # };

  programs.home-manager.enable = true;

  home-manager.users.lucas = { pkgs, ... }: {
    imports = [
      ./zsh.nix
      ./git.nix
    ];
    home.packages = with pkgs; [
      # Shell
      ripgrep
      nodejs
    ];
  };
}
