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
