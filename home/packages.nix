{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol

    imv
    mpv
    zathura

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
