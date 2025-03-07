{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "com.obsproject.Studio"
      "com.usebottles.bottles"
      "com.spotify.Client"
      "page.tesk.Refine"
    ];
  };
}
