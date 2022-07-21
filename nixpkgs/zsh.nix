{ config, pkgs, lib, ... }:

{
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
}