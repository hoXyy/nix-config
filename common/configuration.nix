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
    ./nix-ld.nix
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

  environment.systemPackages = with pkgs; [
    wget
    nixfmt-rfc-style
    nil
    distrobox
    python3Full
  ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
      pkgs-unstable.nerd-fonts.jetbrains-mono
      pkgs.jetbrains-mono
    ];
  };
}
