# nix-config

Nix Configuration for Macos with `home-manager`

### Branchs
- MacOS configuration [macos](https://github.com/Lucas-Kohorst/nix-config)
- NixOS using homemanager [homemanager](https://github.com/Lucas-Kohorst/nix-config/tree/home-manager)
- NixOS using nixpkgs [nixpkgs](https://github.com/Lucas-Kohorst/nix-config/tree/nixpkgs)

### Steps 

1. [Install](https://gist.github.com/ethnt/cfed3027f3676b110bf1df444ef1f30a)

```
# install on zsh with multiuser
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon

# install nix-darwin
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

# install home-manager
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

2. Using Git 
```
# move packages and configurations into a git repository in your home directory
cd
git clone --branch macos https://github.com/Lucas-Kohorst/nix-config.git
cd ~/.config
ln -s ~/nix-config nixpkgs

# if not new machine might need to `rm` or `ln` `~/.gitconfig` to ~/.config/git/`
rm -rf ~/.gitconfig
```

3. Rebuild
```
export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch
```
