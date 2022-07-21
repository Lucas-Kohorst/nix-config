{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    sha256 = "29009058112b83ef3eb1d103ff3315165396da0e932a420a4d2778ec35b7109e";
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

      ./neovim/neovim.nix
    ];
    home.packages = with pkgs; [
      # Shell
      ripgrep
      nodejs
    ];
  };
}
