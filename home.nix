{ config, pkgs, lib, ... }:

{
  # home.packages = with pkgs; [ ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = false; # enabled in oh-my-zsh
      # initExtra = ''
      #   test -f ~/.dir_colors && eval $(dircolors ~/.dir_colors)
      # '';
      # shellAliases = {
      #   ne = "nix-env";
      #   ni = "nix-env -iA";
      #   no = "nixops";
      #   ns = "nix-shell --pure";
      #   please = "sudo";
      # };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "systemd" "rsync" "kubectl" ];
        theme = "terminalparty";
      };
    };

    git = {
      enable = true;
      userName = "Lucas Kohorst";
      userEmail = "kohorstlucas@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "22.05";
  };

  programs.home-manager.enable = true;
}