{ pkgs, ... }:
{
  # Separate files for programs that have options added
  imports = [
    ./git.nix
    ./shell.nix
  ];

  # List of packages to just install, won't have configuration applied by Nix
  home.packages = with pkgs; [
    vscode-fhs
    discord
    gh
    google-chrome

    # GNOME tools
    dconf-editor
    gnome-tweaks
    mission-center

    # GNOME extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.window-is-ready-remover
  ];
}
