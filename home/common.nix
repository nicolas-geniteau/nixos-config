{pkgs, ...}: {
  home = {
    username = "nicolas";
    homeDirectory = "/home/nicolas";
  };

  home.packages = with pkgs; [
    pavucontrol

    imv
    mpv
    zathura

    slurp
    wayshot
  ];

  nix.gc = {
    automatic = true;
    frequency = "weekly";
  };
}
