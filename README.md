# nix-config
Nixos Configuration with `homemanager`

### Branchs
- MacOS configuration [macos](https://github.com/Lucas-Kohorst/nix-config)
- NixOS using homemanager [homemanager](https://github.com/Lucas-Kohorst/nix-config/tree/home-manager)
- NixOS using nixpkgs [nixpkgs](https://github.com/Lucas-Kohorst/nix-config/tree/nixpkgs)

### Steps 

1. Generate and build initial config

```
# generates a base 
# - configuration.nix
# - hardware-configuration.nix
# see https://nixos.wiki/wiki/Nixos-generate-config

nixos-generate-config

# build inital config
nixos-rebuild switch
```

2. Clone this Repository
```
# install git
nix-env -i git

# clone this repository
git clone https://github.com/Lucas-Kohorst/nix-config.git /etc/nixos/nix-config
mv /etc/nixos/nix-config/* /etc/nixos/
rm -rf /etc/nixos/nix-config
```

3. Rebuild your system

```
nixos-rebuild switch --flake '.#'
```
