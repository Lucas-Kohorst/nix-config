# nix-config
Nixos Configuration

### Steps 

1. Generate Initial Config

```
# generates a base 
# - configuration.nix
# - hardware-configuration.nix
# see https://nixos.wiki/wiki/Nixos-generate-config

nixos-generate-config
```

2. Clone this Repository
```
git clone https://github.com/Lucas-Kohorst/nix-config.git /etc/nixos/
```

3. Rebuild your system

```
nixos-rebuild switch
```
