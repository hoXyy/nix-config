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
    ./docker.nix
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Timezone config
  services.automatic-timezoned.enable = true;
  services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";

  # Enable Wayland in Chromium apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Make Node.js work properly
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    fnm
  ];

  environment.systemPackages = with pkgs; [
    wget
    nixfmt-rfc-style
    nil
    distrobox
    python3Full
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
      pkgs-unstable.adwaita-fonts
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      pkgs.jetbrains-mono
    ];
  };
}
