{pkgs, ...}: {
  home = {
    username = "nicolas";
    homeDirectory = "/home/nicolas";
  };

  home.packages = with pkgs; [
    fuzzel
    mpv

    pamixer
    pavucontrol
  ];

  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };
}
