{
  description = "hoxi's NixOS config";

  inputs = {
    # Nixpkgs stable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Nixpkgs unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixOS-hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux"; # Adjust if needed

      # Define stable and unstable package sets
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      nixosConfigurations = {
        hoxi-pc-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              pkgs
              pkgs-unstable
              ;
          };
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            ./hosts/pc/configuration.nix
          ];
        };
      };
    };
}
