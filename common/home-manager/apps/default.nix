{ pkgs, ... }:
{
  # Separate files for programs that have options added
  imports = [
    ./git.nix
    ./shell.nix
  ];

  # List of packages to just install, won't have configuration applied by Nix
  home.packages = with pkgs; [
    discord
    google-chrome
    gimp
    vlc

    # Dev tools
    boxbuddy
    jetbrains-toolbox
    vscode-fhs
    gh
    fnm

    # Shell tools
    starship

    # GNOME tools
    dconf-editor
    mission-center

    # GNOME extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.window-is-ready-remover
    gnomeExtensions.tiling-assistant
  ];
}
