
{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    fuzzel
    nerdfonts
    pamixer
    playerctl
    waylock
    wlr-randr
  ];

  services.dunst.enable = true;
}
