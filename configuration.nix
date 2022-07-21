{ config,
  pkgs,
  ...
}:

{
  imports = [
    ./home.nix
  ];

  # networking and naming
  networking.hostName = "kuutamod-01";

  # System wide packages.
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    vim_configurable
  ];

  # User configs.
  users.users.lucas = {
    isNormalUser = true;
    home = "/home/lucas";
    description = "Lucas Kohorst";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # would be in hardware.nix
  fileSystems."/" =
    { device = "dev/nvme0n1p2";
      fsType = "ext4";
    };

  boot.loader.grub = {
    enable = true;
    version = 2;
    #efiSupport = true;
    device = "/dev/nvme0n1";
  };

  # nix configuration
  system.stateVersion = "22.05";
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # .vimrc configuration

  # .bashrc configuration
}
