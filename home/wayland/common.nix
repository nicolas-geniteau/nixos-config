{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    fuzzel
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    pamixer
    playerctl
    waylock
    wlr-randr
  ];

  services.dunst.enable = true;
}
