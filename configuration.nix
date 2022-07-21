{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 20;
    };
    efi = {
      canTouchEfiVariables = true;
      # efiSysMountPoint = "/boot/efi";
    };
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  # Select internationalization properties.
  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings.LC_TIME = "en_DK.UTF-8"; # ISO-8601 time
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Don't forget to set a password with ‘passwd’.
  users.users.lucas = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
    '';
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    # autoUpgrade = {
    #   enable = true;
    #   flake = "~/nixos";
    #   flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
    # };
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      nerdfonts # (nerdfonts.override { fonts = [ "Iosevka" "Meslo" ]; })
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    dracula-theme # gtk theme

    # tools
    ffmpeg
    wget
    btop
    htop
    ripgrep
    exa
    bat
    fd
  ];

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    NIXOS_OZONE_WL = "1";
  };

  security.sudo = {
    package = pkgs.sudo.override {
      withInsults = true;
    };
    extraConfig = "Defaults insults";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "22.05";
}
