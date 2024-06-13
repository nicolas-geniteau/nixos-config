{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = ["wlr" "gtk"];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [pkgs.river];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
