{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

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