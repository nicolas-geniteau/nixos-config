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

    # python
    poetry
    python3
    rye
    uv
  ];
}
