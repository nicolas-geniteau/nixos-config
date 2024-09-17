{pkgs, ...}: {
  home.packages = with pkgs; [
    imv
    mpv
    pavucontrol
    simple-scan
    slurp
    wayshot
    wl-clipboard-rs
    zathura
  ];

  programs.ncspot = {
    enable = true;
    settings = {
      shuffle = true;
      gapless = true;
      use_nerdfont = true;

      credentials = {
        username_cmd = "echo nicolas.geniteau";
        password_cmd = "pass common/spotify.com/nicolas.geniteau@gmail.com";
      };
    };
  };
}
