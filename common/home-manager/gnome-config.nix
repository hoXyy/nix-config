{ pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
          pkgs.gnomeExtensions.gsconnect.extensionUuid
          pkgs.gnomeExtensions.appindicator.extensionUuid
          pkgs.gnomeExtensions.window-is-ready-remover.extensionUuid
          pkgs.gnomeExtensions.tiling-assistant.extensionUuid
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
        ];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };

      "org/gnome/desktop/wm/keybindings" = {
        switch-windows = [
          "<Super>Tab"
          "<Alt>Tab"
        ];
        switch-applications = [];
        switch-applications-backward = [];
      };

      "org/gnome/desktop/interface" = {
        accent-color = "purple";
        color-scheme = "prefer-dark";
        document-font-name = "Adwaita Sans 11";
        font-name = "Adwaita Sans 11";
        monospace-font-name = "JetBrains Mono Semi-Bold 11";
        enable-hot-corners = false;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        background-opacity = "1";
        custom-theme-shrink = true;
        click-action = "previews";
        disable-overview-on-startup = true;
        dock-fixed = true;
        dock-position = "LEFT";
        extend-height = true;
        height-fraction = "0.9";
        multi-monitor = true;
        running-indicator-dominant-color = true;
        running-indicator-style = "DASHES";
        show-mounts = false;
        transparency-mode = "FIXED";
      };

      "org/gnome/shell/extensions/system-monitor" = {
        show-download = false;
        show-upload = false;
      };

      "org/gnome/nautilus/icon-view" = {
        default-zoom-level = "small";
      };
    };
  };
}
