{pkgs, ...}: {
  home.packages = with pkgs; [
    fd
    gitui
    gnumake
    jq
    ldns
    tcpdump
    tig
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
