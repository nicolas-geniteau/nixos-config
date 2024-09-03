{pkgs, ...}: {
  programs.poetry = {
    enable = true;
    settings = {
      virtualenvs.create = true;
      virtualenvs.in-project = true;
    };
  };

  home.packages = with pkgs; [
    (python3.withPackages(ppkgs: [
      ppkgs.cryptography
      ppkgs.python-lsp-server
    ]))

    jetbrains.pycharm-professional
    poetry
    pyright
    ruff
    rye
    uv
  ];
}
