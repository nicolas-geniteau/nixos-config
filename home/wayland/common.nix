{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    fuzzel
    pamixer
    playerctl
    waylock
    wlr-randr

    font-awesome
    (nerdfonts.override { fonts = [ "Hack" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "Hack Nerd Font Mono" ];
    };

  };

  services.dunst.enable = true;
}
