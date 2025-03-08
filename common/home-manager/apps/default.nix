{ pkgs, ... }:
let
  nvm = import ./nvm.nix { inherit pkgs; };
in
{
  # Separate files for programs that have options added
  imports = [
    ./git.nix
    ./shell.nix
  ];

  # Create nvm.sh file for nvm package
  home.file.".nvm/nvm.sh".source = "${nvm}/share/nvm/nvm.sh";

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
    nvm

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
