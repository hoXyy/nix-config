{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [ "org.gnome.Boxes" ];
  };
}
