{pkgs, ...}: {
  home.packages = with pkgs; [
    gitui
    gnumake
    jq
    ldns
    tcpdump
    unzip

    imv
    mpv
    zathura
    simple-scan
    pavucontrol
    slurp
    wayshot
    wl-clipboard-rs

    awscli2
    docker-compose
    kubectl
    packer
    terraform
    tflint
    vault-bin

    pre-commit
  ];
}
