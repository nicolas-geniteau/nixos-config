{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol

    imv
    mpv
    zathura

    slurp
    wayshot

    ldns
    tcpdump
  ];
}
