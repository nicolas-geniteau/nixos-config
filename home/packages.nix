{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol

    imv
    mpv
    zathura

    simple-scan
    slurp
    wayshot
    wl-clipboard-rs

    ldns
    tcpdump

    # python
    poetry
    python3
    rye
    uv

    awscli2
    kubectl
  ];
}
