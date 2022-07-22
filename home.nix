{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # user configuration 
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  home.stateVersion = "21.05";
 
  # configuration files
  home.file.".vimrc".source = ./config/vimrc; 
  home.file.".bashrc".source = ./config/bashrc;
  home.file.".zshrc".source = ./config/zshrc;

  # programs and packages
  home.packages = with pkgs; [
    # programming
    rustc
    cargo

    # tools
    wget
    btop
    htop
    ripgrep
    exa
    bat
    fd
    teleport
    nomad
    jq
    tmux
    #helm
    kubectl
    docker
    vscode
    #nvm TODO: figure out how to install this
    #git
    #vim
  ];

  # program configuration
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
      userName = "Lucas-Kohorst";
      userEmail = "kohorstlucas@gmail.com";
      
      # ignore home and vim swap files.
      ignores = [ "*~" "*.swp" ];
      
      extraConfig = {
        init.defaultBranch = "main";
        core = {
          editor = "vim";
        };
      };
    }; 
  };
}
