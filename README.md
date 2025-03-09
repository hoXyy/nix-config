# hoxi's NixOS config

My personal NixOS config for my desktop and laptop.

## How to use

Clone repo, and run command depending on device:

- PC
```sh
nixos-rebuild --flake .#hoxi-pc-nixos --use-remote-sudo
```

- Laptop
```sh
nixos-rebuild --flake .#hoxi-laptop-nixos --use-remote-sudo
```