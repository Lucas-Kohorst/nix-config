{ config, pkgs, ... }:

{
  home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "22.05";
  };

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
