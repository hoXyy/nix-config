{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./gnome.nix
    ./flatpak.nix
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Wayland in Chromium apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    wget
    nixfmt-rfc-style
    nil
  ];

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  fonts = {
    enableDefaultPackages = true;
    packages = [
      pkgs.jetbrains-mono
      pkgs-unstable.adwaita-fonts
    ];
  };
}
