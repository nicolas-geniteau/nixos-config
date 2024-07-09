{pkgs, ...}: {
  home.packages = with pkgs; [
    gitui
    gnumake
    jq
    ldns
    tcpdump

    imv
    mpv
    zathura
    simple-scan
    pavucontrol
    slurp
    wayshot
    wl-clipboard-rs

    awscli2
    kubectl
    vault-bin
  ];
}
